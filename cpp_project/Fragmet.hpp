#ifndef FRAGMET_HPP
#define FRAGMET_HPP

class Fragmet {
private:
	int a;
	int b;
protected:
public:
	void postaviMaterijal(Materijal m);
	Materijal dohvatiMaterijal();
	void zapali();
	void eksplodiraj();
	void zaledi();
	bool sudaraSeSaNeVazduhom();
};

#endif // FRAGMET_HPP