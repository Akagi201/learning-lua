all clean:
	-cd lua-1.0	 && $(MAKE) $@
	-cd lua-1.1	 && $(MAKE) $@
	-cd lua-2.1	 && $(MAKE) $@
	-cd lua-2.2	 && $(MAKE) $@
	-cd lua-2.4	 && $(MAKE) $@
	-cd lua-2.5	 && $(MAKE) $@
	-cd lua-2.5.1	 && $(MAKE) $@
	-cd lua-3.0	 && $(MAKE) $@
	-cd lua-3.1	 && $(MAKE) $@
	-cd lua-3.2	 && $(MAKE) $@
	-cd lua-3.2.1	 && $(MAKE) $@
	-cd lua-3.2.2	 && $(MAKE) $@
	-cd lua-4.0	 && $(MAKE) $@
	-cd lua-4.0.1	 && $(MAKE) $@
	-cd lua-5.0	 && $(MAKE) $@
	-cd lua-5.0.1	 && $(MAKE) $@
	-cd lua-5.0.2	 && $(MAKE) $@
	-cd lua-5.0.3	 && $(MAKE) $@
	-cd lua-5.1	 && $(MAKE) $@
	-cd lua-5.1.1	 && $(MAKE) $@
	-cd lua-5.1.2	 && $(MAKE) $@
	-cd lua-5.1.3	 && $(MAKE) $@
	-cd lua-5.1.4	 && $(MAKE) $@
	-cd lua-5.1.5	 && $(MAKE) $@
	-cd lua-5.2.0	 && $(MAKE) $@
	-cd lua-5.2.1	 && $(MAKE) $@
	-cd lua-5.2.2	 && $(MAKE) $@
	-cd lua-5.2.3	 && $(MAKE) $@
	-cd lua-5.2.4	 && $(MAKE) $@
	-cd lua-5.3.0	 && $(MAKE) $@
	-cd lua-5.3.1	 && $(MAKE) $@

distr:	clean tar

tar:
	cd .. && tar zcf lua-all.tar.gz lua-all/*

loc:
	@for i in lua* ; do echo -n $$i ; wc -l $$i/*.[ch] | grep total ; done

touch:
	@# for i in lua* ; do r=`ls -t $$i/* | head -1` ; touch -r $$r $$i ; done
	@for i in lua* ; do touch -r ../$$i.tar.gz $$i ; done

run:
	@for i in lua* ; do echo $$i ; $$i/lua -v /dev/null ; done

