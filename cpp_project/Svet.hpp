#ifndef SVET_HPP
#define SVET_HPP

class Svet {
private:
	static Svet instanca;
	void Svet();
protected:
public:
	static Svet getInstance();
	void dohvatiFragment(int x, int y);
	Alhemicar dohvatiAlhemicara();
	Fragment sudaraSe(Projektil p);
	Fragment dohvatiOkolneFragmente(Fragment f);
};

#endif // SVET_HPP