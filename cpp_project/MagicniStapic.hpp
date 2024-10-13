#ifndef MAGICNISTAPIC_HPP
#define MAGICNISTAPIC_HPP

class MagicniStapic {
private:
protected:
public:
	Projektil ispaliProjektil();
	void postaviMagiju(Magija m);
	void napraviZakonKretanja() = 0;
	void primeniMagiju(Fragment f);
};

#endif // MAGICNISTAPIC_HPP