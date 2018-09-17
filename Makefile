.SUFFIXES:
.PHONY:

CACHE_DIR := .MkCache
$(shell mkdir -p $(CACHE_DIR) > /dev/null)

$(shell mkdir -p MSG > /dev/null)
$(shell mkdir -p MSG/3rdParty > /dev/null)

MSG_DIST_FILES := \
  Core.event \
  StatGetters.event \
  3rdParty/InjectConGetters.event \
  3rdParty/InjectMovGetters.event

dist: $(addprefix MSG/,$(MSG_DIST_FILES))

.PHONY: dist

%.o: %.s
	$(AS) -mcpu=arm7tdmi -mthumb-interwork $< -o $@

%.dmp: %.o
	$(OBJCOPY) -S $< -O binary $@

# NONPROCESSED EVENTS

MSG/%.event: src/%.event
	cp -f $< $@

# PROCESSED EVENTS

$(CACHE_DIR)/%.d: src/%.event_unprocessed
	$(PYTHON3) tools/mgpp.py $< -o MSG/$*.event -m $@

MSG/%.event: src/%.event_unprocessed $(CACHE_DIR)/%.d
	$(PYTHON3) tools/mgpp.py $< -o $@ || rm -f $@

-include $(CACHE_DIR)/Core.d $(CACHE_DIR)/StatGetters.d
