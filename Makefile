TARGETS=emacs bashrc profile

all: $(addprefix $(HOME)/., $(TARGETS))

$(HOME)/.%: dot.%
	cp $? $@
