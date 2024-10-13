#ifndef MATERIJAL_HPP
#define MATERIJAL_HPP

class Materijal {
private:
protected:
public:
	void zapali(Fragment f) = 0;
	void eksplodiraj(Fragment f) = 0;
	void zaledi(Fragment f) = 0;
};

#endif // MATERIJAL_HPP