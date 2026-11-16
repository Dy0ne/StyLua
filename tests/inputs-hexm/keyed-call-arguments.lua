local empty_dict, empty_list = dict(), list()
local proxies = plan:get("kongfu", dictproxy()), plan:get("slots", listproxy())

local timing = dictproxy(NOT_ACTION = 1, FAKE_ATTACK = 2,   REAL_ATTACK=3)
local status = dictproxy(PREPARE = 0, ATTACK = 1, ["DEFEND"] = 2)
local harm = dictproxy([_M.RESOURCE_ID_HP] = list(431, 432))
local flags = dictproxy([_M.NPC_STUFF] = _M.FLAG_AUTO_INIT | _M.FLAG_DICT)

-- keyed arguments are not limited to the builtin constructors
local point = list(x = data[1], y = data[2])
local mixed = list(1, 2, last = 3)
self:_on_move_touch(list(current = curr_pos, last = last_pos))
local chained = obj:method(x = 1):other(list(y = 2)).field

_M.DECISION_ACTION_2_CONSUME_RESOURCE_CNT = dictproxy([slap_face_consts.SLAP_FACE_SKILL_SLOT_ID_NORMAL] = 0, [slap_face_consts.SLAP_FACE_SKILL_SLOT_ID_FAKE] = 2, [slap_face_consts.SLAP_FACE_SKILL_SLOT_ID_EVADE] = 3)

_M.SHORT = dictproxy(
  a = 1,
  b = 2
)

local nested = dict(name = "translate_words_map_zh_cn", t_len = 576416, n_rows = dict([-2483574451012029589] = "activity text", [-3206338384023110413] = "more text", [2136946011192587450] = "data"))

local with_function = dict(callback = function() return 1 end, handler = function(a, b)
  print(a, b)
end, values = { 1, 2, 3 })

foo(dict(aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa = 1111111111111111111, bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb = 22222222222222222222, c = dict(x = 1)), 5)

-- trailing commas are allowed (Python-kwargs style) and dropped on format
local trailing_single = dict(id = data.id, hostnum = data.hostnum,)
local trailing_positional = list(from_pid,)
local trailing_multiline = dict(
  func_name = "add_common_confirm_window",
  func_param = list(dict(a = 1, b = 2,)),
)

return dict(ok = true)
