ScaryHouse: m_bedroom.o ScaryHouse.o
	gfortran m_status.o m_bedroom.o ScaryHouse.o -o ScaryHouse
	
ScaryHouse.o: ScaryHouse.f90 m_bedroom.mod m_status.mod
	gfortran -c ScaryHouse.f90 -o ScaryHouse.o
	
m_bedroom.o m_bedroom.mod: m_bedroom.f90 m_status.mod
	gfortran -c m_bedroom.f90 -o m_bedroom.o

m_status.o m_status.mod: m_status.f90
	gfortran -c m_status.f90 -o m_status.o
	
.PHONEY: clean 
clean: 
	rm -f ScaryHouse ScaryHouse.o m_bedroom.o m_bedroom.mod m_status.o m_status.mod 