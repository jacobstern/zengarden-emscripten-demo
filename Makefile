export OS=Emscripten
export PKG_CONFIG_PATH

module:
	$(MAKE) -C ZenGarden/src/
	emcc -O3 --memory-init-file 0 -o dst/module.js ZenGarden/libs/Emscripten/libzengarden.bc \
		-s EXPORTED_FUNCTIONS="['_zg_context_new', '_zg_context_new_graph_from_file', '_zg_graph_attach', \
		'_zg_context_process', '_zg_context_delete', '_zg_context_send_messageV']"

clean:
	$(MAKE) -C ZenGarden/src/ clean
	rm dst/module.js