name_project=space_intruders

dir_src=$(CURDIR)/src
dir_svg=$(dir_src)/asset/svg

dir_rocktree=$(CURDIR)/rocks
dir_lib=$(dir_rocktree)/share/lua/5.1

dir_target=$(CURDIR)/target
dir_target_lib=$(dir_target)/lib
dir_rsvg=$(dir_target)/asset/rsvg

file_love=$(dir_target)/$(name_project).love

files_svg=$(wildcard $(dir_svg)/*.svg)
names_svg=$(notdir $(files_svg))
names_png=$(names_svg:.svg=.png)
files_png=$(addprefix $(dir_rsvg)/,$(names_png))

all: love

install: # TODO

$(dir_target) $(dir_rsvg):
	mkdir -p $@

luarocks:
	luarocks --tree=$(dir_rocktree) make >/dev/null

$(dir_rsvg)/%.png: | $(dir_rsvg)
	rsvg $(dir_svg)/$*.svg $(dir_rsvg)/$*.png

love: luarocks $(files_png) | $(dir_target)
	cp -r $(dir_src)/* $(dir_target)
	cp -r $(dir_lib) $(dir_target_lib)
	cd $(dir_target) && zip -q9r $(file_love) .

clean:
	rm -rf $(dir_target)

pristine: clean
	rm -rf $(dir_rocktree)
