#ifndef VAZDUH_HPP
#define VAZDUH_HPP

class Vazduh : public Materijal {
private:
protected:
public:
	void zapali(Fragment f);
	void eksplodiraj(Fragment f);
	void zaledi(Fragment f);
};

#endif // VAZDUH_HPP