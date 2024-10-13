#ifndef SIMULATORKRETANJA_HPP
#define SIMULATORKRETANJA_HPP

class SImulatorKretanja {
private:
	static SimulatorKretanja instance;
	void SImulatorKretanja();
	void pomeriProjektile();
protected:
public:
	static SimulatorKretanja getInstance();
	void run();
	void registrujProjektil(Projektil p);
	void postaviInterval(int interval);
	void ukloniProjektil(Projektil p);
};

#endif // SIMULATORKRETANJA_HPP