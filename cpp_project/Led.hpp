#ifndef LED_HPP
#define LED_HPP

class Led : public Materijal {
private:
protected:
public:
	void zapali(Fragment f);
	void eksplodiraj(Fragment f);
	void zaledi(Fragment f);
};

#endif // LED_HPP