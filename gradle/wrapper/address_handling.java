//rest of the code
    public EthereumAddress(String address) {
        if (!isValidAddress(address)) {
            throw new IllegalArgumentException("Invalid Ethereum address.");
        }
        this.address = address.toLowerCase(); 
    }

    public static boolean isValidAddress(String address) {
        if (address == null || !address.matches("^0x[a-fA-F0-9]{40}$")) {
            return false; // Basic format check
        }

        if (address.matches("^0x[0-9a-f]{40}$") || address.matches("^0x[0-9A-F]{40}$")) {
                     return true;
        }

        return checkEIP55Checksum(address);
    }
//rest of the code 