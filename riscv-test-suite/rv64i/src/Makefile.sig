SRC=$(wildcard *.log)
OBJ=$(patsubst %.log, %.signature_output, $(SRC))

all:$(OBJ)

$(OBJ):%.signature_output:%.log
	grep 'paddr 0080000' $^ | grep 'miss' | awk '{print $$18}' | cut -b 1-8 > $@
	
clean:
	rm -rf *.signature_output *.log
		
