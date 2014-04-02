TARGETS=emacs bashrc profile zshrc

updatehomedir: $(addprefix $(HOME)/., $(TARGETS))
$(HOME)/.%: dot.%
	cp $? $@


updaterepo: $(addprefix dot., $(TARGETS))
dot.%: $(HOME)/.%
	cp $? $@

.PHONY: updatehomedir updaterepo
