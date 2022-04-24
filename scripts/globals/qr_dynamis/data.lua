-----------------------------------
--- Data Related to QR Dynamis
-----------------------------------
require("scripts/globals/zone")
require("scripts/globals/keyitems")
-----------------------------------
xi.qr_dynamis = xi.qr_dynamis or {}

--------------------------
-- Dynamis - San D'oria --
-------------------------
xi.qr_dynamis.sandyList = {
    17534980, -- Vanguard Footsoldier
    17534981, -- Vanguard Trooper
    17534982, -- Vanguard Amputator
    17534983, -- Vanguard Vexer
    17534984, -- Vanguard Pillager
    17534985, -- Vanguard Mesmerizer
    17534986, -- Vanguard Grappler
    17534987, -- Vanguard Neckchopper
    17534988, -- Vanguard Mesmerizer
    17534989, -- Vanguard Bugler
    17534990, -- Vanguard Gutslasher
    17534991, -- Vanguard Impaler
    17534993, -- Vanguard Backstabber
    17534994, -- Vanguard Hawker
    17534996, -- Vanguard Dollmaster
    17534998, -- Vanguard Vexer
    17534999, -- Vanguard Predator
    17535000, -- Vanguard Footsoldier
    17535001, -- Vanguard Grappler
    17535002, -- Vanguard Predator
    17535008, -- Vanguard Trooper
    17535009, -- Vanguard Amputator
    17535010, -- Vanguard Dollmaster
    17535012, -- Vanguard Footsoldier
    17535013, -- Vanguard Backstabber
    17535014, -- Vanguard Impaler
    17535016, -- Vanguard Footsoldier
    17535017, -- Vanguard Grappler
    17535018, -- Vanguard Amputator
    17535019, -- Vanguard Trooper
    17535020, -- Vanguard Neckchopper
    17535021, -- Vanguard Pillager
    17535022, -- Vanguard Bugler
    17535023, -- Vanguard Predator
    17535024, -- Vanguard Vexer
    17535025, -- Vanguard Trooper
    17535027, -- Vanguard Bugler
    17535028, -- Vanguard Hawker
    17535030, -- Vanguard Gutslasher
    17535031, -- Vanguard Backstabber
    17535034, -- Vanguard Footsoldier
    17535035, -- Vanguard Grappler
    17535036, -- Vanguard Pillager
    17535037, -- Vanguard Trooper
    17535038, -- Vanguard Neckchopper
    17535039, -- Vanguard Predator
    17535040, -- Vanguard Gutslasher
    17535041, -- Vanguard Backstabber
    17535042, -- Vanguard Impaler
    17535045, -- Vanguard Amputator
    17535046, -- Vanguard Mesmerizer
    17535047, -- Vanguard Vexer
    17535048, -- Vanguard Bugler
    17535049, -- Vanguard Dollmaster
    17535051, -- Vanguard Mesmerizer
    17535052, -- Vanguard Bugler
    17535053, -- Vanguard Neckchopper
    17535054, -- Vanguard Pillager
    17535055, -- Vanguard Vexer
    17535056, -- Vanguard Trooper
    17535058, -- Vanguard Footsoldier
    17535059, -- Vanguard Grappler
    17535060, -- Vanguard Amputator
    17535061, -- Vanguard Mesmerizer
    17535062, -- Vanguard Vexer
    17535063, -- Vanguard Pillager
    17535064, -- Vanguard Trooper
    17535065, -- Vanguard Neckchopper
    17535066, -- Vanguard Hawker
    17535068, -- Vanguard Bugler
    17535069, -- Vanguard Predator
    17535070, -- Vanguard Gutslasher
    17535071, -- Vanguard Backstabber
    17535072, -- Vanguard Impaler
    17535074, -- Vanguard Dollmaster
    17535076, -- Vanguard Hawker
    17535078, -- Vanguard Bugler
    17535079, -- Vanguard Grappler
    17535080, -- Vanguard Mesmerizer
    17535081, -- Vanguard Pillager
    17535082, -- Vanguard Gutslasher
    17535083, -- Vanguard Backstabber
    17535084, -- Vanguard Trooper
    17535085, -- Vanguard Footsoldier
    17535086, -- Vanguard Amputator
    17535087, -- Vanguard Neckchopper
    17535088, -- Vanguard Bugler
    17535089, -- Vanguard Predator
    17535090, -- Vanguard Backstabber
    17535091, -- Vanguard Grappler
    17535092, -- Vanguard Gutslasher
    17535093, -- Vanguard Predator
    17535094, -- Vanguard Hawker
    17535096, -- Vanguard Impaler
    17535098, -- Vanguard Footsoldier
    17535099, -- Vanguard Amputator
    17535100, -- Vanguard Bugler
    17535101, -- Vanguard Predator
    17535102, -- Vanguard Backstabber
    17535103, -- Vanguard Grappler
    17535104, -- Vanguard Gutslasher
    17535105, -- Vanguard Trooper
    17535106, -- Vanguard Predator
    17535107, -- Vanguard Mesmerizer
    17535108, -- Vanguard Vexer
    17535109, -- Vanguard Neckchopper
    17535110, -- Vanguard Dollmaster
    17535112, -- Vanguard Backstabber
    17535116, -- Vanguard Footsoldier
    17535117, -- Vanguard Amputator
    17535118, -- Vanguard Bugler
    17535119, -- Vanguard Predator
    17535120, -- Vanguard Predator
    17535121, -- Vanguard Vexer
    17535122, -- Vanguard Neckchopper
    17535123, -- Vanguard Backstabber
    17535124, -- Vanguard Grappler
    17535125, -- Vanguard Trooper
    17535126, -- Vanguard Vexer
    17535127, -- Vanguard Trooper
    17535129, -- Vanguard Vexer
    17535130, -- Vanguard Trooper
    17535132, -- Vanguard Vexer
    17535133, -- Vanguard Mesmerizer
    17535134, -- Vanguard Footsoldier
    17535135, -- Vanguard Pillager
    17535136, -- Vanguard Predator
    17535137, -- Vanguard Vexer
    17535138, -- Vanguard Trooper
    17535140, -- Vanguard Footsoldier
    17535141, -- Vanguard Amputator
    17535142, -- Vanguard Trooper
    17535143, -- Vanguard Gutslasher
    17535144, -- Vanguard Footsoldier
    17535145, -- Vanguard Grappler
    17535146, -- Vanguard Pillager
    17535147, -- Vanguard Trooper
    17535148, -- Vanguard Neckchopper
    17535149, -- Vanguard Hawker
    17535151, -- Vanguard Predator
    17535152, -- Vanguard Impaler
    17535156, -- Vanguard Footsoldier
    17535157, -- Vanguard Grappler
    17535158, -- Vanguard Pillager
    17535159, -- Vanguard Trooper
    17535160, -- Vanguard Neckchopper
    17535161, -- Vanguard Hawker
    17535163, -- Vanguard Predator
    17535164, -- Vanguard Impaler
    17535168, -- Vanguard Gutslasher
    17535169, -- Vanguard Gutslasher
    17535170, -- Vanguard Footsoldier
    17535171, -- Vanguard Pillager
    17535172, -- Vanguard Neckchopper
    17535173, -- Vanguard Hawker
    17535175, -- Vanguard Backstabber
    17535176, -- Vanguard Backstabber
    17535177, -- Vanguard Grappler
    17535178, -- Vanguard Trooper
    17535179, -- Vanguard Impaler
    17535181, -- Vanguard Dollmaster
    17535183, -- Vanguard Amputator
    17535184, -- Vanguard Amputator
    17535185, -- Vanguard Mesmerizer
    17535186, -- Vanguard Mesmerizer
    17535187, -- Vanguard Vexer
    17535188, -- Vanguard Vexer
    17535189, -- Vanguard Bugler
    17535190, -- Vanguard Bugler
    17535191, -- Vanguard Dollmaster
    17535195, -- Vanguard Amputator
    17535196, -- Vanguard Amputator
    17535197, -- Vanguard Mesmerizer
    17535198, -- Vanguard Mesmerizer
    17535199, -- Vanguard Vexer
    17535200, -- Vanguard Vexer
    17535201, -- Vanguard Bugler
    17535202, -- Vanguard Bugler
    17535203, -- Vanguard Dollmaster
}

------------------------
-- Dynamis - Windurst --
------------------------
xi.qr_dynamis.windyList = {
    17543172, -- Vanguard Skirmisher
    17543173, -- Vanguard Priest
    17543174, -- Vanguard Prelate
    17543175, -- Vanguard Chanter
    17543176, -- Vanguard Sentinel
    17543177, -- Vanguard Priest
    17543178, -- Vanguard Visionary
    17543179, -- Vanguard Chanter
    17543180, -- Vanguard Liberator
    17543181, -- Vanguard Sentinel
    17543182, -- Vanguard Inciter
    17543183, -- Vanguard Exemplar
    17543184, -- Vanguard Salvager
    17543185, -- Vanguard Inciter
    17543186, -- Vanguard Ogresoother
    17543188, -- Vanguard Persecutor
    17543189, -- Vanguard Assassin
    17543190, -- Vanguard Persecutor
    17543191, -- Vanguard Assassin
    17543192, -- Vanguard Partisan
    17543194, -- Vanguard Chanter
    17543195, -- Vanguard Salvager
    17543196, -- Vanguard Oracle
    17543198, -- Vanguard Skirmisher
    17543199, -- Vanguard Priest
    17543200, -- Vanguard Prelate
    17543201, -- Vanguard Visionary
    17543202, -- Vanguard Liberator
    17543203, -- Vanguard Ogresoother
    17543205, -- Vanguard Chanter
    17543206, -- Vanguard Sentinel
    17543207, -- Vanguard Persecutor
    17543208, -- Vanguard Assassin
    17543209, -- Vanguard Salvager
    17543210, -- Vanguard Skirmisher
    17543211, -- Vanguard Exemplar
    17543212, -- Vanguard Skirmisher
    17543213, -- Vanguard Salvager
    17543214, -- Vanguard Salvager
    17543215, -- Vanguard Prelate
    17543216, -- Vanguard Oracle
    17543218, -- Vanguard Skirmisher
    17543219, -- Vanguard Priest
    17543220, -- Vanguard Salvager
    17543221, -- Vanguard Assassin
    17543222, -- Vanguard Prelate
    17543223, -- Vanguard Visionary
    17543224, -- Vanguard Liberator
    17543225, -- Vanguard Salvager
    17543226, -- Vanguard Liberator
    17543227, -- Vanguard Liberator
    17543228, -- Vanguard Sentinel
    17543229, -- Vanguard Partisan
    17543231, -- Vanguard Exemplar
    17543232, -- Vanguard Inciter
    17543233, -- Vanguard Exemplar
    17543234, -- Vanguard Inciter
    17543235, -- Vanguard Ogresoother
    17543237, -- Vanguard Partisan
    17543239, -- Vanguard Ogresoother
    17543241, -- Vanguard Partisan
    17543243, -- Vanguard Salvager
    17543244, -- Vanguard Prelate
    17543245, -- Vanguard Assassin
    17543246, -- Vanguard Persecutor
    17543247, -- Vanguard Salvager
    17543248, -- Vanguard Prelate
    17543249, -- Vanguard Assassin
    17543250, -- Vanguard Persecutor
    17543251, -- Vanguard Skirmisher
    17543252, -- Vanguard Sentinel
    17543253, -- Vanguard Priest
    17543254, -- Vanguard Prelate
    17543255, -- Vanguard Chanter
    17543256, -- Vanguard Partisan
    17543260, -- Vanguard Skirmisher
    17543261, -- Vanguard Sentinel
    17543262, -- Vanguard Priest
    17543263, -- Vanguard Prelate
    17543264, -- Vanguard Visionary
    17543265, -- Vanguard Liberator
    17543266, -- Vanguard Partisan
    17543270, -- Vanguard Salvager
    17543271, -- Vanguard Persecutor
    17543272, -- Vanguard Oracle
    17543274, -- Vanguard Ogresoother
    17543276, -- Vanguard Skirmisher
    17543277, -- Vanguard Chanter
    17543278, -- Vanguard Liberator
    17543279, -- Vanguard Assassin
    17543280, -- Vanguard Prelate
    17543281, -- Vanguard Exemplar
    17543282, -- Vanguard Exemplar
    17543283, -- Vanguard Inciter
    17543284, -- Vanguard Inciter
    17543285, -- Vanguard Prelate
    17543286, -- Vanguard Oracle
    17543288, -- Vanguard Inciter
    17543289, -- Vanguard Exemplar
    17543290, -- Vanguard Skirmisher
    17543291, -- Vanguard Sentinel
    17543292, -- Vanguard Visionary
    17543293, -- Vanguard Liberator
    17543296, -- Vanguard Exemplar
    17543297, -- Vanguard Inciter
    17543298, -- Vanguard Prelate
    17543299, -- Vanguard Oracle
    17543301, -- Vanguard Salvager
    17543302, -- Vanguard Chanter
    17543303, -- Vanguard Assassin
    17543304, -- Vanguard Priest
    17543307, -- Vanguard Liberator
    17543308, -- Vanguard Exemplar
    17543309, -- Vanguard Assassin
    17543310, -- Vanguard Ogresoother
    17543312, -- Vanguard Skirmisher
    17543313, -- Vanguard Skirmisher
    17543314, -- Vanguard Persecutor
    17543315, -- Vanguard Skirmisher
    17543316, -- Vanguard Priest
    17543317, -- Vanguard Visionary
    17543318, -- Vanguard Prelate
    17543319, -- Vanguard Sentinel
    17543320, -- Vanguard Liberator
    17543321, -- Vanguard Priest
    17543322, -- Vanguard Visionary
    17543323, -- Vanguard Prelate
    17543324, -- Vanguard Skirmisher
    17543325, -- Vanguard Sentinel
    17543326, -- Vanguard Sentinel
    17543327, -- Vanguard Liberator
    17543328, -- Vanguard Visionary
    17543329, -- Vanguard Exemplar
    17543330, -- Vanguard Inciter
    17543331, -- Vanguard Inciter
    17543332, -- Vanguard Ogresoother
    17543334, -- Vanguard Assassin
    17543335, -- Vanguard Persecutor
    17543336, -- Vanguard Chanter
    17543337, -- Vanguard Oracle
    17543339, -- Vanguard Partisan
    17543341, -- Vanguard Assassin
    17543343, -- Vanguard Priest
    17543344, -- Vanguard Chanter
    17543346, -- Vanguard Exemplar
    17543347, -- Vanguard Assassin
    17543348, -- Vanguard Persecutor
    17543349, -- Vanguard Skirmisher
    17543350, -- Vanguard Visionary
    17543351, -- Vanguard Oracle
    17543355, -- Vanguard Priest
    17543356, -- Vanguard Chanter
    17543358, -- Vanguard Sentinel
    17543359, -- Vanguard Persecutor
    17543360, -- Vanguard Partisan
    17543364, -- Vanguard Assassin
    17543365, -- Vanguard Liberator
    17543366, -- Vanguard Inciter
    17543367, -- Vanguard Ogresoother
    17543369, -- Vanguard Visionary
    17543370, -- Vanguard Persecutor
    17543371, -- Vanguard Assassin
    17543373, -- Vanguard Priest
    17543374, -- Vanguard Chanter
    17543376, -- Vanguard Salvager
    17543377, -- Vanguard Skirmisher
    17543378, -- Vanguard Skirmisher
    17543379, -- Vanguard Priest
    17543380, -- Vanguard Prelate
    17543381, -- Vanguard Visionary
    17543382, -- Vanguard Sentinel
    17543383, -- Vanguard Sentinel
    17543384, -- Vanguard Exemplar
    17543385, -- Vanguard Ogresoother
    17543387, -- Vanguard Inciter
    17543388, -- Vanguard Liberator
    17543389, -- Vanguard Priest
    17543390, -- Vanguard Salvager
    17543391, -- Vanguard Assassin
    17543394, -- Vanguard Salvager
    17543395, -- Vanguard Inciter
    17543396, -- Vanguard Skirmisher
    17543397, -- Vanguard Priest
    17543398, -- Vanguard Prelate
    17543399, -- Vanguard Prelate
    17543400, -- Vanguard Visionary
    17543401, -- Vanguard Visionary
    17543402, -- Vanguard Skirmisher
    17543403, -- Vanguard Sentinel
    17543404, -- Vanguard Liberator
    17543405, -- Vanguard Liberator
    17543406, -- Vanguard Ogresoother
    17543408, -- Vanguard Assassin
    17543411, -- Vanguard Salvager
    17543412, -- Vanguard Inciter
    17543413, -- Vanguard Persecutor
    17543414, -- Vanguard Chanter
    17543415, -- Vanguard Partisan
    17543417, -- Vanguard Chanter
    17543418, -- Vanguard Assassin
    17543422, -- Vanguard Salvager
    17543423, -- Vanguard Inciter
    17543424, -- Vanguard Oracle
    17543426, -- Vanguard Chanter
    17543427, -- Vanguard Persecutor
    17543428, -- Vanguard Assassin
    17543429, -- Vanguard Salvager
    17543430, -- Vanguard Salvager
    17543431, -- Vanguard Partisan
    17543433, -- Vanguard Chanter
    17543434, -- Vanguard Chanter
    17543435, -- Vanguard Persecutor
    17543436, -- Vanguard Persecutor
    17543437, -- Vanguard Assassin
    17543438, -- Vanguard Assassin
    17543439, -- Vanguard Assassin
    17543440, -- Vanguard Chanter
    17543441, -- Vanguard Persecutor
    17543442, -- Vanguard Oracle
    17543444, -- Vanguard Oracle
    17543447, -- Vanguard Skirmisher
    17543448, -- Vanguard Sentinel
    17543449, -- Vanguard Priest
    17543450, -- Vanguard Prelate
    17543451, -- Vanguard Visionary
    17543452, -- Vanguard Liberator
    17543453, -- Vanguard Exemplar
    17543454, -- Vanguard Inciter
    17543455, -- Vanguard Chanter
    17543456, -- Vanguard Salvager
    17543457, -- Vanguard Persecutor
    17543458, -- Vanguard Assassin
    17543459, -- Vanguard Oracle
}

xi.qr_dynamis.bastyList = {
    17539074, -- Vanguard Vindicator
    17539075, -- Vanguard Militant
    17539076, -- Vanguard Beasttender
    17539078, -- Vanguard Thaumaturge
    17539079, -- Vanguard Protector
    17539080, -- Vanguard Purloiner
    17539081, -- Vanguard Vigilante
    17539082, -- Vanguard Defender
    17539083, -- Vanguard Vindicator
    17539084, -- Vanguard Constable
    17539085, -- Vanguard Thaumaturge
    17539086, -- Vanguard Hatamoto
    17539087, -- Vanguard Kusa
    17539088, -- Vanguard Drakekeeper
    17539090, -- Vanguard Vindicator
    17539091, -- Vanguard Militant
    17539092, -- Vanguard Vigilante
    17539093, -- Vanguard Vigilante
    17539094, -- Vanguard Minstrel
    17539095, -- Vanguard Mason
    17539096, -- Vanguard Hatamoto
    17539097, -- Vanguard Kusa
    17539098, -- Vanguard Undertaker
    17539100, -- Vanguard Protector
    17539101, -- Vanguard Constable
    17539102, -- Vanguard Thaumaturge
    17539103, -- Vanguard Defender
    17539104, -- Vanguard Defender
    17539105, -- Vanguard Drakekeeper
    17539107, -- Vanguard Purloiner
    17539108, -- Vanguard Militant
    17539109, -- Vanguard Minstrel
    17539110, -- Vanguard Beasttender
    17539112, -- Vanguard Drakekeeper
    17539114, -- Vanguard Vindicator
    17539115, -- Vanguard Militant
    17539116, -- Vanguard Vigilante
    17539117, -- Vanguard Mason
    17539121, -- Vanguard Defender
    17539122, -- Vanguard Minstrel
    17539123, -- Vanguard Thaumaturge
    17539124, -- Vanguard Protector
    17539125, -- Vanguard Constable
    17539126, -- Vanguard Vigilante
    17539127, -- Vanguard Defender
    17539128, -- Vanguard Minstrel
    17539129, -- Vanguard Vindicator
    17539130, -- Vanguard Militant
    17539131, -- Vanguard Purloiner
    17539132, -- Vanguard Mason
    17539133, -- Vanguard Vindicator
    17539134, -- Vanguard Purloiner
    17539135, -- Vanguard Militant
    17539136, -- Vanguard Vigilante
    17539137, -- Vanguard Thaumaturge
    17539138, -- Vanguard Vigilante
    17539139, -- Vanguard Thaumaturge
    17539140, -- Vanguard Vigilante
    17539141, -- Vanguard Thaumaturge
    17539145, -- Vanguard Purloiner
    17539146, -- Vanguard Purloiner
    17539150, -- Vanguard Hatamoto
    17539151, -- Vanguard Kusa
    17539152, -- Vanguard Hatamoto
    17539153, -- Vanguard Purloiner
    17539154, -- Vanguard Vindicator
    17539155, -- Vanguard Mason
    17539156, -- Vanguard Kusa
    17539157, -- Vanguard Purloiner
    17539158, -- Vanguard Vindicator
    17539159, -- Vanguard Militant
    17539160, -- Vanguard Mason
    17539164, -- Vanguard Drakekeeper
    17539166, -- Vanguard Undertaker
    17539168, -- Vanguard Thaumaturge
    17539169, -- Vanguard Vigilante
    17539170, -- Vanguard Mason
    17539174, -- Vanguard Vigilante
    17539175, -- Vanguard Vigilante
    17539176, -- Vanguard Defender
    17539177, -- Vanguard Beasttender
    17539179, -- Vanguard Thaumaturge
    17539180, -- Vanguard Protector
    17539181, -- Vanguard Protector
    17539182, -- Vanguard Constable
    17539183, -- Vanguard Vigilante
    17539184, -- Vanguard Defender
    17539185, -- Vanguard Thaumaturge
    17539186, -- Vanguard Protector
    17539187, -- Vanguard Constable
    17539189, -- Vanguard Defender
    17539191, -- Vanguard Vindicator
    17539192, -- Vanguard Militant
    17539193, -- Vanguard Constable
    17539194, -- Vanguard Thaumaturge
    17539195, -- Vanguard Protector
    17539196, -- Vanguard Defender
    17539197, -- Vanguard Beasttender
    17539199, -- Vanguard Drakekeeper
    17539201, -- Vanguard Purloiner
    17539202, -- Vanguard Vigilante
    17539203, -- Vanguard Minstrel
    17539204, -- Vanguard Hatamoto
    17539205, -- Vanguard Minstrel
    17539206, -- Vanguard Mason
    17539207, -- Vanguard Hatamoto
    17539208, -- Vanguard Kusa
    17539209, -- Vanguard Undertaker
    17539211, -- Vanguard Undertaker
    17539213, -- Vanguard Beasttender
    17539215, -- Vanguard Vindicator
    17539216, -- Vanguard Protector
    17539217, -- Vanguard Vigilante
    17539218, -- Vanguard Hatamoto
    17539219, -- Vanguard Hatamoto
    17539220, -- Vanguard Kusa
    17539221, -- Vanguard Kusa
    17539222, -- Vanguard Undertaker
    17539224, -- Vanguard Minstrel
    17539225, -- Vanguard Protector
    17539226, -- Vanguard Defender
    17539230, -- Vanguard Hatamoto
    17539231, -- Vanguard Kusa
    17539232, -- Vanguard Protector
    17539233, -- Vanguard Defender
    17539237, -- Vanguard Beasttender
    17539239, -- Vanguard Drakekeeper
    17539241, -- Vanguard Vindicator
    17539242, -- Vanguard Militant
    17539243, -- Vanguard Constable
    17539244, -- Vanguard Vindicator
    17539245, -- Vanguard Constable
    17539246, -- Vanguard Thaumaturge
    17539247, -- Vanguard Beasttender
    17539249, -- Vanguard Drakekeeper
    17539251, -- Vanguard Thaumaturge
    17539252, -- Vanguard Vigilante
    17539254, -- Vanguard Vindicator
    17539255, -- Vanguard Vindicator
    17539256, -- Vanguard Defender
    17539257, -- Vanguard Purloiner
    17539258, -- Vanguard Vigilante
    17539259, -- Vanguard Militant
    17539260, -- Vanguard Protector
    17539261, -- Vanguard Militant
    17539262, -- Vanguard Militant
    17539263, -- Vanguard Vigilante
    17539264, -- Vanguard Vigilante
    17539265, -- Vanguard Protector
    17539268, -- Vanguard Constable
    17539269, -- Vanguard Constable
    17539270, -- Vanguard Thaumaturge
    17539271, -- Vanguard Thaumaturge
    17539272, -- Vanguard Undertaker
    17539276, -- Vanguard Purloiner
    17539277, -- Vanguard Purloiner
    17539278, -- Vanguard Defender
    17539279, -- Vanguard Vigilante
    17539280, -- Vanguard Thaumaturge
    17539281, -- Vanguard Hatamoto
    17539282, -- Vanguard Kusa
    17539283, -- Vanguard Minstrel
    17539284, -- Vanguard Beasttender
    17539288, -- Vanguard Hatamoto
    17539289, -- Vanguard Kusa
    17539290, -- Vanguard Minstrel
    17539291, -- Vanguard Drakekeeper
    17539295, -- Vanguard Hatamoto
    17539296, -- Vanguard Minstrel
    17539297, -- Vanguard Purloiner
    17539298, -- Vanguard Thaumaturge
    17539299, -- Vanguard Vigilante
    17539300, -- Vanguard Vindicator
    17539301, -- Vanguard Militant
    17539302, -- Vanguard Vigilante
    17539303, -- Vanguard Protector
    17539304, -- Vanguard Constable
    17539305, -- Vanguard Minstrel
}

---------------------
-- Dynamis - Jeuno --
---------------------

xi.qr_dynamis.jeunoList = {
    17547266, -- Vanguard Smithy
    17547267, -- Vanguard Welldigger
    17547268, -- Vanguard Pathfinder
    17547270, -- Vanguard Shaman
    17547271, -- Vanguard Enchanter
    17547272, -- Vanguard Pathfinder
    17547274, -- Vanguard Tinkerer
    17547275, -- Vanguard Armorer
    17547276, -- Vanguard Hitman
    17547278, -- Vanguard Pitfighter
    17547279, -- Vanguard Alchemist
    17547280, -- Vanguard Maestro
    17547281, -- Vanguard Tinkerer
    17547282, -- Vanguard Dragontamer
    17547284, -- Vanguard Enchanter
    17547285, -- Vanguard Ambusher
    17547288, -- Vanguard Ronin
    17547289, -- Vanguard Armorer
    17547290, -- Vanguard Hitman
    17547292, -- Vanguard Armorer
    17547293, -- Vanguard Hitman
    17547304, -- Vanguard Smithy
    17547305, -- Vanguard Welldigger
    17547306, -- Vanguard Ambusher
    17547307, -- Vanguard Armorer
    17547308, -- Vanguard Alchemist
    17547309, -- Vanguard Welldigger
    17547310, -- Vanguard Enchanter
    17547314, -- Vanguard Smithy
    17547315, -- Vanguard Pitfighter
    17547316, -- Vanguard Ronin
    17547317, -- Vanguard Necromancer
    17547319, -- Vanguard Alchemist
    17547320, -- Vanguard Shaman
    17547321, -- Vanguard Enchanter
    17547325, -- Vanguard Welldigger
    17547326, -- Vanguard Maestro
    17547327, -- Vanguard Necromancer
    17547331, -- Vanguard Maestro
    17547332, -- Vanguard Dragontamer
    17547334, -- Vanguard Alchemist
    17547335, -- Vanguard Shaman
    17547336, -- Vanguard Enchanter
    17547339, -- Vanguard Welldigger
    17547340, -- Vanguard Ambusher
    17547341, -- Vanguard Pathfinder
    17547343, -- Vanguard Pitfighter
    17547344, -- Vanguard Enchanter
    17547345, -- Vanguard Maestro
    17547346, -- Vanguard Ambusher
    17547347, -- Vanguard Ambusher
    17547348, -- Vanguard Dragontamer
    17547350, -- Vanguard Pitfighter
    17547351, -- Vanguard Alchemist
    17547352, -- Vanguard Tinkerer
    17547353, -- Vanguard Armorer
    17547354, -- Vanguard Hitman
    17547357, -- Vanguard Smithy
    17547358, -- Vanguard Shaman
    17547359, -- Vanguard Maestro
    17547360, -- Vanguard Welldigger
    17547361, -- Vanguard Tinkerer
    17547362, -- Vanguard Ambusher
    17547363, -- Vanguard Smithy
    17547364, -- Vanguard Armorer
    17547365, -- Vanguard Pathfinder
    17547367, -- Vanguard Ronin
    17547368, -- Vanguard Hitman
    17547369, -- Vanguard Pathfinder
    17547371, -- Vanguard Armorer
    17547372, -- Vanguard Shaman
    17547373, -- Vanguard Necromancer
    17547375, -- Vanguard Pitfighter
    17547376, -- Vanguard Tinkerer
    17547379, -- Vanguard Smithy
    17547380, -- Vanguard Alchemist
    17547383, -- Vanguard Ronin
    17547384, -- Vanguard Hitman
    17547385, -- Vanguard Alchemist
    17547386, -- Vanguard Maestro
    17547398, -- Vanguard Smithy
    17547399, -- Vanguard Pitfighter
    17547401, -- Vanguard Alchemist
    17547403, -- Vanguard Smithy
    17547404, -- Vanguard Pitfighter
    17547405, -- Vanguard Welldigger
    17547406, -- Vanguard Shaman
    17547408, -- Vanguard Smithy
    17547409, -- Vanguard Pitfighter
    17547410, -- Vanguard Welldigger
    17547411, -- Vanguard Enchanter
    17547412, -- Vanguard Alchemist
    17547413, -- Vanguard Shaman
    17547414, -- Vanguard Smithy
    17547415, -- Vanguard Pitfighter
    17547416, -- Vanguard Alchemist
    17547417, -- Vanguard Shaman
    17547418, -- Vanguard Enchanter
    17547419, -- Vanguard Welldigger
    17547425, -- Vanguard Tinkerer
    17547426, -- Vanguard Dragontamer
    17547430, -- Vanguard Maestro
    17547431, -- Vanguard Ronin
    17547432, -- Vanguard Armorer
    17547433, -- Vanguard Maestro
    17547434, -- Vanguard Tinkerer
    17547435, -- Vanguard Ronin
    17547436, -- Vanguard Necromancer
    17547441, -- Vanguard Tinkerer
    17547442, -- Vanguard Ronin
    17547443, -- Vanguard Necromancer
    17547445, -- Vanguard Maestro
    17547446, -- Vanguard Ronin
    17547447, -- Vanguard Armorer
    17547448, -- Vanguard Maestro
    17547449, -- Vanguard Tinkerer
    17547450, -- Vanguard Pathfinder
    17547452, -- Vanguard Dragontamer
    17547459, -- Vanguard Ambusher
    17547460, -- Vanguard Hitman
    17547461, -- Vanguard Ambusher
    17547462, -- Vanguard Hitman
    17547463, -- Vanguard Ambusher
    17547464, -- Vanguard Hitman
    17547465, -- Vanguard Ambusher
    17547466, -- Vanguard Hitman
    17547469, -- Vanguard Smithy
    17547470, -- Vanguard Pitfighter
    17547471, -- Vanguard Welldigger
    17547475, -- Vanguard Alchemist
    17547476, -- Vanguard Shaman
    17547477, -- Vanguard Enchanter
    17547481, -- Vanguard Armorer
    17547482, -- Vanguard Tinkerer
    17547483, -- Vanguard Pathfinder
    17547489, -- Vanguard Ambusher
    17547491, -- Vanguard Hitman
    17547286, -- Vanguard Necromancer
    17547330, -- Vanguard Ronin
    17547400, -- Vanguard Welldigger
    17547428, -- Vanguard Pathfinder
}

--------------------------
-- Dynamis - Beaucedine --
--------------------------

xi.qr_dynamis.beaucedineQuadavList = {
    17326099, -- Vanguard Vindicator
    17326100, -- Vanguard Vindicator
    17326101, -- Vanguard Protector
    17326102, -- Vanguard Protector
    17326103, -- Vanguard Beasttender
    17326105, -- Vanguard Minstrel
    17326107, -- Vanguard Militant
    17326108, -- Vanguard Militant
    17326109, -- Vanguard Protector
    17326110, -- Vanguard Protector
    17326111, -- Vanguard Drakekeeper
    17326113, -- Vanguard Minstrel
    17326115, -- Vanguard Constable
    17326116, -- Vanguard Defender
    17326117, -- Vanguard Protector
    17326118, -- Vanguard Hatamoto
    17326119, -- Vanguard Kusa
    17326120, -- Vanguard Protector
    17326121, -- Vanguard Purloiner
    17326122, -- Vanguard Mason
    17326123, -- Vanguard Mason
    17326124, -- Vanguard Undertaker
    17326127, -- Vanguard Militant
    17326128, -- Vanguard Protector
    17326129, -- Vanguard Purloiner
    17326130, -- Vanguard Vigilante
    17326131, -- Vanguard Vindicator
    17326132, -- Vanguard Vindicator
    17326133, -- Vanguard Militant
    17326134, -- Vanguard Constable
    17326136, -- Vanguard Militant
    17326137, -- Vanguard Purloiner
    17326138, -- Vanguard Defender
    17326139, -- Vanguard Vigilante
    17326140, -- Vanguard Vigilante
    17326141, -- Vanguard Constable
    17326142, -- Vanguard Constable
    17326143, -- Vanguard Beasttender
    17326146, -- Vanguard Undertaker
    17326148, -- Vanguard Vindicator
    17326149, -- Vanguard Vindicator
    17326150, -- Vanguard Minstrel
    17326152, -- Vanguard Constable
    17326153, -- Vanguard Thaumaturge
    17326154, -- Vanguard Thaumaturge
    17326155, -- Vanguard Protector
    17326157, -- Vanguard Drakekeeper
    17326159, -- Vanguard Hatamoto
    17326160, -- Vanguard Hatamoto
    17326161, -- Vanguard Kusa
    17326164, -- Vanguard Thaumaturge
    17326165, -- Vanguard Vigilante
    17326166, -- Vanguard Militant
    17326167, -- Vanguard Militant
    17326169, -- Vanguard Vindicator
    17326170, -- Vanguard Constable
    17326171, -- Vanguard Defender
    17326172, -- Vanguard Defender
    17326174, -- Vanguard Purloiner
    17326175, -- Vanguard Purloiner
    17326176, -- Vanguard Minstrel
    17326177, -- Vanguard Beasttender
    17326181, -- Vanguard Vigilante
    17326182, -- Vanguard Hatamoto
    17326183, -- Vanguard Mason
    17326184, -- Vanguard Mason
    17326186, -- Vanguard Constable
    17326187, -- Vanguard Thaumaturge
    17326188, -- Vanguard Hatamoto
    17326189, -- Vanguard Hatamoto
    17326191, -- Vanguard Protector
    17326192, -- Vanguard Militant
    17326193, -- Vanguard Kusa
    17326194, -- Vanguard Kusa
    17326196, -- Vanguard Thaumaturge
    17326197, -- Vanguard Thaumaturge
    17326198, -- Vanguard Thaumaturge
    17326199, -- Vanguard Undertaker
}

xi.qr_dynamis.beaucedineOrcishList = {
    17326208, -- Vanguard Trooper
    17326209, -- Vanguard Neckchopper
    17326210, -- Vanguard Footsoldier
    17326211, -- Vanguard Footsoldier
    17326213, -- Vanguard Vexer
    17326214, -- Vanguard Vexer
    17326215, -- Vanguard Backstabber
    17326217, -- Vanguard Grappler
    17326219, -- Vanguard Footsoldier
    17326220, -- Vanguard Gutslasher
    17326221, -- Vanguard Amputator
    17326222, -- Vanguard Amputator
    17326224, -- Vanguard Backstabber
    17326225, -- Vanguard Impaler
    17326227, -- Vanguard Predator
    17326228, -- Vanguard Predator
    17326230, -- Vanguard Grappler
    17326231, -- Vanguard Dollmaster
    17326235, -- Vanguard Vexer
    17326236, -- Vanguard Vexer
    17326238, -- Vanguard Mesmerizer
    17326239, -- Vanguard Hawker
    17326241, -- Vanguard Pillager
    17326242, -- Vanguard Pillager
    17326244, -- Vanguard Pillager
    17326245, -- Vanguard Predator
    17326246, -- Vanguard Trooper
    17326247, -- Vanguard Trooper
    17326249, -- Vanguard Neckchopper
    17326250, -- Vanguard Footsoldier
    17326251, -- Vanguard Bugler
    17326252, -- Vanguard Dollmaster
    17326254, -- Vanguard Gutslasher
    17326256, -- Vanguard Neckchopper
    17326257, -- Vanguard Neckchopper
    17326259, -- Vanguard Amputator
    17326260, -- Vanguard Mesmerizer
    17326261, -- Vanguard Mesmerizer
    17326263, -- Vanguard Hawker
    17326267, -- Vanguard Bugler
    17326268, -- Vanguard Bugler
    17326269, -- Vanguard Bugler
    17326271, -- Vanguard Impaler
}


xi.qr_dynamis.beaucedineYagudoList = {
    17326280, -- Vanguard Sentinel
    17326281, -- Vanguard Assassin
    17326282, -- Vanguard Skirmisher
    17326283, -- Vanguard Skirmisher
    17326285, -- Vanguard Visionary
    17326286, -- Vanguard Liberator
    17326287, -- Vanguard Sentinel
    17326288, -- Vanguard Sentinel
    17326290, -- Vanguard Exemplar
    17326291, -- Vanguard Ogresoother
    17326293, -- Vanguard Priest
    17326294, -- Vanguard Priest
    17326296, -- Vanguard Inciter
    17326297, -- Vanguard Chanter
    17326298, -- Vanguard Prelate
    17326299, -- Vanguard Prelate
    17326301, -- Vanguard Skirmisher
    17326302, -- Vanguard Visionary
    17326303, -- Vanguard Visionary
    17326305, -- Vanguard Partisan
    17326309, -- Vanguard Skirmisher
    17326310, -- Vanguard Priest
    17326311, -- Vanguard Liberator
    17326312, -- Vanguard Liberator
    17326314, -- Vanguard Salvager
    17326315, -- Vanguard Oracle
    17326317, -- Vanguard Exemplar
    17326318, -- Vanguard Exemplar
    17326320, -- Vanguard Prelate
    17326321, -- Vanguard Inciter
    17326322, -- Vanguard Inciter
    17326324, -- Vanguard Assassin
    17326326, -- Vanguard Ogresoother
    17326330, -- Vanguard Persecutor
    17326331, -- Vanguard Partisan
    17326333, -- Vanguard Chanter
    17326334, -- Vanguard Chanter
    17326336, -- Vanguard Liberator
    17326337, -- Vanguard Prelate
    17326338, -- Vanguard Salvager
    17326339, -- Vanguard Salvager
    17326341, -- Vanguard Assassin
    17326342, -- Vanguard Persecutor
    17326343, -- Vanguard Persecutor
    17326345, -- Vanguard Oracle
}

xi.qr_dynamis.beaucedineGoblinList = {
    17326354, -- Vanguard Smithy
    17326355, -- Vanguard Pitfighter
    17326356, -- Vanguard Shaman
    17326357, -- Vanguard Enchanter
    17326358, -- Vanguard Pathfinder
    17326360, -- Vanguard Maestro
    17326361, -- Vanguard Enchanter
    17326362, -- Vanguard Welldigger
    17326363, -- Vanguard Armorer
    17326364, -- Vanguard Shaman
    17326365, -- Vanguard Armorer
    17326366, -- Vanguard Maestro
    17326367, -- Vanguard Ambusher
    17326368, -- Vanguard Necromancer
    17326370, -- Vanguard Welldigger
    17326371, -- Vanguard Armorer
    17326372, -- Vanguard Smithy
    17326373, -- Vanguard Smithy
    17326375, -- Vanguard Ronin
    17326376, -- Vanguard Hitman
    17326377, -- Vanguard Pitfighter
    17326378, -- Vanguard Pitfighter
    17326380, -- Vanguard Shaman
    17326381, -- Vanguard Enchanter
    17326382, -- Vanguard Welldigger
    17326383, -- Vanguard Dragontamer
    17326385, -- Vanguard Alchemist
    17326386, -- Vanguard Alchemist
    17326388, -- Vanguard Smithy
    17326389, -- Vanguard Enchanter
    17326390, -- Vanguard Alchemist
    17326391, -- Vanguard Necromancer
    17326393, -- Vanguard Pitfighter
    17326394, -- Vanguard Ambusher
    17326395, -- Vanguard Shaman
    17326396, -- Vanguard Shaman
    17326398, -- Vanguard Armorer
    17326399, -- Vanguard Enchanter
    17326400, -- Vanguard Enchanter
    17326402, -- Vanguard Welldigger
    17326403, -- Vanguard Hitman
    17326404, -- Vanguard Hitman
    17326406, -- Vanguard Pathfinder
    17326408, -- Vanguard Welldigger
    17326409, -- Vanguard Welldigger
    17326411, -- Vanguard Tinkerer
    17326412, -- Vanguard Maestro
    17326413, -- Vanguard Armorer
    17326414, -- Vanguard Armorer
    17326416, -- Vanguard Maestro
    17326417, -- Vanguard Pathfinder
    17326423, -- Vanguard Smithy
    17326424, -- Vanguard Pitfighter
    17326425, -- Vanguard Tinkerer
    17326426, -- Vanguard Tinkerer
    17326428, -- Vanguard Pitfighter
    17326429, -- Vanguard Pitfighter
    17326430, -- Vanguard Pitfighter
    17326431, -- Vanguard Alchemist
    17326432, -- Vanguard Alchemist
    17326433, -- Vanguard Alchemist
    17326434, -- Vanguard Maestro
    17326437, -- Vanguard Pathfinder
    17326441, -- Vanguard Armorer
    17326442, -- Vanguard Shaman
    17326443, -- Vanguard Enchanter
    17326444, -- Vanguard Necromancer
    17326448, -- Vanguard Armorer
    17326449, -- Vanguard Ronin
    17326450, -- Vanguard Maestro
    17326451, -- Vanguard Maestro
    17326453, -- Vanguard Welldigger
    17326456, -- Vanguard Ambusher
    17326457, -- Vanguard Ambusher
    17326459, -- Vanguard Pitfighter
    17326460, -- Vanguard Hitman
    17326461, -- Vanguard Ronin
    17326462, -- Vanguard Ronin
}

xi.qr_dynamis.beaucedineHydraList = {
    17326469, -- Hydra Warrior
    17326470, -- Hydra Monk
    17326471, -- Hydra White Mage
    17326472, -- Hydra Red Mage
    17326474, -- Hydra Monk
    17326475, -- Hydra Black Mage
    17326476, -- Hydra Red Mage
    17326477, -- Hydra Thief
    17326479, -- Hydra White Mage
    17326480, -- Hydra Paladin
    17326481, -- Hydra Dark Knight
    17326482, -- Hydra Beastmaster
    17326485, -- Hydra Bard
    17326486, -- Hydra Ranger
    17326487, -- Hydra Samurai
    17326488, -- Hydra Samurai
    17326489, -- Hydra Samurai
    17326490, -- Hydra Ninja
    17326491, -- Hydra Ninja
    17326492, -- Hydra Dragoon
    17326495, -- Hydra Samurai
    17326496, -- Hydra Samurai
    17326497, -- Hydra Ninja
    17326498, -- Hydra Ninja
    17326499, -- Hydra Summoner
    17326502, -- Hydra Warrior
    17326503, -- Hydra Dragoon
    17326505, -- Hydra Summoner
    17326508, -- Hydra Warrior
    17326509, -- Hydra Beastmaster
    17326511, -- Hydra Samurai
    17326512, -- Hydra Warrior
    17326513, -- Hydra Samurai
    17326515, -- Hydra Monk
    17326516, -- Hydra Ranger
    17326517, -- Hydra White Mage
    17326518, -- Hydra Red Mage
    17326520, -- Hydra Paladin
    17326521, -- Hydra Black Mage
    17326522, -- Hydra White Mage
    17326523, -- Hydra Red Mage
    17326524, -- Hydra Thief
    17326526, -- Hydra Bard
    17326527, -- Hydra Paladin
    17326528, -- Hydra White Mage
    17326529, -- Hydra Ninja
    17326531, -- Hydra Dragoon
    17326533, -- Hydra Bard
    17326534, -- Hydra Dark Knight
    17326535, -- Hydra Ninja
    17326537, -- Hydra Paladin
    17326538, -- Hydra Warrior
    17326539, -- Hydra Monk
    17326540, -- Hydra Summoner
    17326543, -- Hydra Ranger
    17326544, -- Hydra White Mage
    17326545, -- Hydra Black Mage
    17326546, -- Hydra Paladin
    17326548, -- Hydra Paladin
    17326549, -- Hydra Dragoon
    17326551, -- Hydra Dark Knight
    17326552, -- Hydra Ranger
    17326554, -- Hydra Dark Knight
    17326555, -- Hydra Thief
    17326556, -- Hydra Samurai
    17326557, -- Hydra Ninja
    17326559, -- Hydra Warrior
    17326560, -- Hydra White Mage
    17326561, -- Hydra Black Mage
    17326562, -- Hydra Warrior
    17326563, -- Hydra White Mage
    17326564, -- Hydra Black Mage
    17326566, -- Hydra Samurai
    17326567, -- Hydra Ninja
    17326568, -- Hydra Monk
    17326569, -- Hydra Samurai
    17326570, -- Hydra Ninja
    17326571, -- Hydra Monk
    17326573, -- Hydra White Mage
    17326574, -- Hydra Black Mage
    17326575, -- Hydra Red Mage
    17326576, -- Hydra White Mage
    17326577, -- Hydra Black Mage
    17326578, -- Hydra Red Mage
    17326580, -- Hydra Thief
    17326581, -- Hydra Dark Knight
    17326582, -- Hydra Thief
    17326583, -- Hydra Dark Knight
    17326584, -- Hydra Summoner
    17326587, -- Hydra Beastmaster
    17326589, -- Hydra Bard
    17326590, -- Hydra Ranger
    17326591, -- Hydra Bard
    17326592, -- Hydra Ranger
    17326594, -- Hydra Dragoon
    17326596, -- Hydra Paladin
    17326597, -- Hydra Thief
    17326598, -- Hydra Paladin
    17326599, -- Hydra Thief
    17326601, -- Hydra Beastmaster
    17326603, -- Hydra Beastmaster
    17326605, -- Hydra Thief
    17326606, -- Hydra Dark Knight
    17326608, -- Hydra Warrior
    17326609, -- Hydra Warrior
    17326610, -- Hydra Bard
    17326611, -- Hydra Ranger
    17326613, -- Hydra White Mage
    17326614, -- Hydra White Mage
    17326615, -- Hydra Thief
    17326616, -- Hydra Dark Knight
    17326618, -- Hydra Monk
    17326619, -- Hydra Monk
    17326620, -- Hydra Ninja
    17326621, -- Hydra Summoner
    17326624, -- Hydra Black Mage
    17326625, -- Hydra Black Mage
    17326626, -- Hydra Warrior
    17326627, -- Hydra Dragoon
    17326630, -- Hydra Red Mage
    17326631, -- Hydra Red Mage
    17326632, -- Hydra Paladin
    17326633, -- Hydra Monk
    17326635, -- Hydra Thief
    17326636, -- Hydra Thief
    17326637, -- Hydra White Mage
    17326638, -- Hydra Samurai
    17326640, -- Hydra Dragoon
    17326642, -- Hydra Dragoon
    17326644, -- Hydra Red Mage
    17326645, -- Hydra Bard
    17326647, -- Hydra Paladin
    17326648, -- Hydra Paladin
    17326649, -- Hydra Monk
    17326650, -- Hydra Thief
    17326652, -- Hydra Dark Knight
    17326653, -- Hydra Dark Knight
    17326654, -- Hydra White Mage
    17326655, -- Hydra Black Mage
    17326657, -- Hydra Bard
    17326658, -- Hydra Bard
    17326659, -- Hydra Samurai
    17326660, -- Hydra Monk
    17326662, -- Hydra Summoner
    17326664, -- Hydra Summoner
    17326666, -- Hydra Ninja
    17326667, -- Hydra Dark Knight
    17326669, -- Hydra Ranger
    17326670, -- Hydra Ranger
    17326671, -- Hydra Dark Knight
    17326672, -- Hydra Ninja
    17326674, -- Hydra Samurai
    17326675, -- Hydra Samurai
    17326676, -- Hydra Warrior
    17326677, -- Hydra White Mage
    17326679, -- Hydra Ninja
    17326680, -- Hydra Ninja
    17326681, -- Hydra Black Mage
    17326682, -- Hydra Paladin
    17326684, -- Hydra Thief
    17326685, -- Hydra Beastmaster
    17326687, -- Hydra Ranger
    17326689, -- Hydra Black Mage
    17326690, -- Hydra Paladin
    17326691, -- Hydra Ninja
    17326693, -- Hydra Warrior
    17326694, -- Hydra Monk
    17326695, -- Hydra Samurai
    17326697, -- Hydra White Mage
    17326698, -- Hydra Dark Knight
    17326699, -- Hydra Summoner
    17326702, -- Hydra Red Mage
    17326703, -- Hydra Bard
    17326704, -- Hydra Dragoon
    17326707, -- Hydra Warrior
    17326708, -- Hydra White Mage
    17326709, -- Hydra Monk
    17326710, -- Hydra Red Mage
    17326711, -- Hydra White Mage
    17326712, -- Hydra Thief
    17326713, -- Hydra Paladin
    17326714, -- Hydra Dark Knight
    17326715, -- Hydra Beastmaster
    17326717, -- Hydra Warrior
    17326718, -- Hydra Thief
    17326719, -- Hydra Bard
    17326720, -- Hydra White Mage
    17326722, -- Hydra Monk
    17326723, -- Hydra Samurai
    17326724, -- Hydra Summoner
    17326726, -- Hydra Red Mage
    17326728, -- Hydra Paladin
    17326729, -- Hydra Ninja
    17326730, -- Hydra Ranger
    17326731, -- Hydra Black Mage
    17326733, -- Hydra Dark Knight
    17326734, -- Hydra Dragoon
    17326736, -- Hydra White Mage
    17326738, -- Hydra Paladin
    17326739, -- Hydra Warrior
    17326740, -- Hydra White Mage
    17326741, -- Hydra Thief
    17326743, -- Hydra Monk
    17326744, -- Hydra Bard
    17326745, -- Hydra Ranger
    17326746, -- Hydra Dragoon
    17326749, -- Hydra Dark Knight
    17326750, -- Hydra Samurai
    17326751, -- Hydra Ninja
    17326752, -- Hydra Summoner
    17326755, -- Hydra White Mage
    17326756, -- Hydra Black Mage
    17326757, -- Hydra Red Mage
    17326758, -- Hydra Beastmaster
    17326761, -- Hydra Black Mage
    17326762, -- Hydra Dark Knight
    17326763, -- Hydra Ranger
    17326764, -- Hydra Ninja
    17326766, -- Hydra Warrior
    17326767, -- Hydra Red Mage
    17326768, -- Hydra Ninja
    17326769, -- Hydra Dragoon
    17326772, -- Hydra Monk
    17326773, -- Hydra White Mage
    17326774, -- Hydra Black Mage
    17326775, -- Hydra Summoner
    17326777, -- Hydra Bard
    17326778, -- Hydra White Mage
    17326779, -- Hydra Thief
    17326780, -- Hydra Paladin
    17326782, -- Hydra Warrior
    17326783, -- Hydra Beastmaster
    17326785, -- Hydra Monk
    17326787, -- Hydra Black Mage
    17326788, -- Hydra Red Mage
    17326789, -- Hydra Dark Knight
}
-----------------------------------
-- Dynamis-Xarcabard
-----------------------------------

xi.qr_dynamis.xarcabardList = {
    17330215, -- Kindred Paladin
    17330216, -- Kindred Paladin
    17330217, -- Kindred Dark Knight
    17330218, -- Kindred Dark Knight
    17330219, -- Kindred Beastmaster
    17330221, -- Kindred Ranger
    17330222, -- Kindred Bard
    17330224, -- Kindred Samurai
    17330225, -- Kindred Samurai
    17330226, -- Kindred Ninja
    17330227, -- Kindred Ninja
    17330228, -- Kindred Summoner
    17330232, -- Kindred Dragoon
    17330234, -- Kindred Dragoon
    17330236, -- Kindred White Mage
    17330237, -- Kindred Black Mage
    17330238, -- Kindred Red Mage
    17330239, -- Kindred Bard
    17330242, -- Kindred Warrior
    17330243, -- Kindred Warrior
    17330244, -- Kindred Monk
    17330245, -- Kindred Thief
    17330246, -- Kindred Beastmaster
    17330250, -- Kindred Paladin
    17330251, -- Kindred Paladin
    17330252, -- Kindred Samurai
    17330253, -- Kindred Ninja
    17330254, -- Kindred Summoner
    17330258, -- Kindred Dark Knight
    17330259, -- Kindred Dark Knight
    17330260, -- Kindred Red Mage
    17330261, -- Kindred Black Mage
    17330262, -- Kindred Bard
    17330263, -- Kindred Dragoon
    17330265, -- Kindred Ranger
    17330266, -- Kindred Ranger
    17330267, -- Kindred Samurai
    17330268, -- Kindred Samurai
    17330269, -- Kindred Ninja
    17330270, -- Kindred Ninja
    17330271, -- Kindred Thief
    17330272, -- Kindred Thief
    17330275, -- Kindred White Mage
    17330276, -- Kindred White Mage
    17330277, -- Kindred Black Mage
    17330278, -- Kindred Black Mage
    17330279, -- Kindred Red Mage
    17330280, -- Kindred Red Mage
    17330281, -- Kindred Summoner
    17330283, -- Kindred Summoner
    17330287, -- Kindred Paladin
    17330288, -- Kindred Paladin
    17330289, -- Kindred White Mage
    17330294, -- Kindred Paladin
    17330295, -- Kindred Paladin
    17330296, -- Kindred Beastmaster
    17330298, -- Kindred Black Mage
    17330303, -- Kindred Monk
    17330305, -- Kindred Thief
    17330313, -- Kindred Monk
    17330314, -- Kindred Thief
    17330323, -- Kindred Warrior
    17330324, -- Kindred Monk
    17330325, -- Kindred Ranger
    17330326, -- Kindred White Mage
    17330327, -- Kindred Black Mage
    17330328, -- Kindred Dark Knight
    17330329, -- Kindred Dragoon
    17330331, -- Kindred White Mage
    17330333, -- Kindred Black Mage
    17330341, -- Kindred White Mage
    17330342, -- Kindred Black Mage
    17330351, -- Kindred Paladin
    17330352, -- Kindred Red Mage
    17330354, -- Kindred Red Mage
    17330359, -- Kindred Paladin
    17330361, -- Kindred Dark Knight
    17330369, -- Kindred Dark Knight
    17330370, -- Kindred Dark Knight
    17330371, -- Kindred Black Mage
    17330376, -- Kindred Warrior
    17330378, -- Kindred Beastmaster
    17330387, -- Kindred Warrior
    17330388, -- Kindred Beastmaster
    17330399, -- Kindred Thief
    17330400, -- Kindred Ninja
    17330401, -- Kindred Ranger
    17330402, -- Kindred Thief
    17330403, -- Kindred Ninja
    17330404, -- Kindred Ranger
    17330405, -- Kindred Warrior
    17330406, -- Kindred Monk
    17330407, -- Kindred White Mage
    17330408, -- Kindred Black Mage
    17330409, -- Kindred Red Mage
    17330410, -- Kindred Paladin
    17330411, -- Kindred Dark Knight
    17330412, -- Kindred Thief
    17330413, -- Kindred Ninja
    17330414, -- Kindred Ranger
    17330416, -- Kindred Dark Knight
    17330418, -- Kindred Dragoon
    17330427, -- Kindred Dark Knight
    17330428, -- Kindred Dragoon
    17330439, -- Kindred Samurai
    17330441, -- Kindred Ninja
    17330449, -- Kindred Samurai
    17330450, -- Kindred Ninja
    17330452, -- Kindred Summoner
    17330461, -- Kindred Warrior
    17330462, -- Kindred Monk
    17330463, -- Kindred White Mage
    17330464, -- Kindred Black Mage
    17330465, -- Kindred Red Mage
    17330466, -- Kindred Thief
    17330467, -- Kindred Paladin
    17330468, -- Kindred Dark Knight
    17330469, -- Kindred Beastmaster
    17330473, -- Kindred Bard
    17330474, -- Kindred Ranger
    17330475, -- Kindred Samurai
    17330476, -- Kindred Ninja
    17330477, -- Kindred Dragoon
    17330479, -- Kindred Summoner
    17330485, -- Kindred Warrior
    17330486, -- Kindred Monk
    17330487, -- Kindred White Mage
    17330488, -- Kindred Black Mage
    17330489, -- Kindred Red Mage
    17330490, -- Kindred Thief
    17330491, -- Kindred Bard
    17330492, -- Kindred Bard
    17330493, -- Kindred Summoner
    17330499, -- Kindred Bard
    17330500, -- Kindred Bard
    17330501, -- Kindred Summoner
    17330536, -- Kindred Warrior
    17330537, -- Kindred Warrior
    17330538, -- Kindred White Mage
    17330539, -- Kindred White Mage
    17330540, -- Kindred Red Mage
    17330541, -- Kindred Red Mage
    17330543, -- Kindred Monk
    17330544, -- Kindred Monk
    17330545, -- Kindred Black Mage
    17330546, -- Kindred Black Mage
    17330547, -- Kindred Thief
    17330548, -- Kindred Thief
    17330550, -- Kindred Paladin
    17330551, -- Kindred Paladin
    17330552, -- Kindred Dark Knight
    17330553, -- Kindred Dark Knight
    17330554, -- Kindred Beastmaster
    17330556, -- Kindred Bard
    17330557, -- Kindred Bard
    17330558, -- Kindred Ranger
    17330559, -- Kindred Ranger
    17330560, -- Kindred Beastmaster
    17330563, -- Kindred White Mage
    17330564, -- Kindred Red Mage
    17330565, -- Kindred Black Mage
    17330566, -- Kindred Bard
    17330568, -- Kindred Samurai
    17330569, -- Kindred Samurai
    17330570, -- Kindred Ninja
    17330571, -- Kindred Ninja
    17330572, -- Kindred Dragoon
    17330574, -- Kindred Summoner
    17330576, -- Kindred White Mage
    17330577, -- Kindred Paladin
    17330578, -- Kindred Dark Knight
    17330579, -- Kindred Bard
    17330580, -- Kindred Ranger
    17330582, -- Kindred Thief
    17330583, -- Kindred Ranger
    17330584, -- Kindred Samurai
    17330585, -- Kindred Ninja
    17330587, -- Kindred Warrior
    17330588, -- Kindred Monk
    17330589, -- Kindred Dark Knight
    17330590, -- Kindred Samurai
    17330591, -- Kindred Ninja
    17330592, -- Kindred White Mage
    17330593, -- Kindred Black Mage
    17330594, -- Kindred Red Mage
    17330595, -- Kindred Thief
    17330596, -- Kindred Summoner
    17330598, -- Kindred Paladin
    17330599, -- Kindred Beastmaster
    17330601, -- Kindred Bard
    17330602, -- Kindred Ranger
    17330603, -- Kindred Samurai
    17330604, -- Kindred Bard
    17330605, -- Kindred Bard
    17330606, -- Kindred Samurai
    17330607, -- Kindred Samurai
    17330608, -- Kindred Dragoon
    17330611, -- Kindred Ranger
    17330612, -- Kindred Ranger
    17330613, -- Kindred Ninja
    17330614, -- Kindred Ninja
    17330615, -- Kindred Summoner
    17330618, -- Kindred Warrior
    17330619, -- Kindred White Mage
    17330620, -- Kindred Black Mage
    17330621, -- Kindred Thief
    17330622, -- Kindred Warrior
    17330623, -- Kindred Monk
    17330624, -- Kindred Black Mage
    17330625, -- Kindred Red Mage
    17330626, -- Kindred Monk
    17330627, -- Kindred White Mage
    17330628, -- Kindred Black Mage
    17330629, -- Kindred Red Mage
    17330630, -- Kindred Thief
    17330632, -- Kindred Paladin
    17330633, -- Kindred Dark Knight
    17330634, -- Kindred Beastmaster
    17330637, -- Kindred Bard
    17330638, -- Kindred Ranger
    17330639, -- Kindred Dragoon
    17330641, -- Kindred Samurai
    17330642, -- Kindred Ninja
    17330643, -- Kindred Dragoon
    17330645, -- Kindred Summoner
    17330647, -- Kindred Thief
    17330648, -- Kindred Bard
    17330649, -- Kindred Ranger
    17330650, -- Kindred Ranger
    17330651, -- Kindred Dark Knight
    17330652, -- Kindred Samurai
    17330653, -- Kindred Dragoon
    17330655, -- Kindred Red Mage
    17330656, -- Kindred Paladin
    17330657, -- Kindred White Mage
    17330658, -- Kindred White Mage
    17330659, -- Kindred Black Mage
    17330660, -- Kindred Black Mage
    17330661, -- Kindred Red Mage
    17330663, -- Kindred Warrior
    17330664, -- Kindred Thief
    17330665, -- Kindred Thief
    17330666, -- Kindred Paladin
    17330667, -- Kindred Paladin
    17330669, -- Kindred Dark Knight
    17330670, -- Kindred Beastmaster
    17330672, -- Kindred Bard
    17330673, -- Kindred Samurai
    17330674, -- Kindred Samurai
    17330675, -- Kindred Ninja
    17330676, -- Kindred Ninja
    17330677, -- Kindred Summoner
    17330679, -- Kindred Warrior
    17330680, -- Kindred Monk
    17330681, -- Kindred Thief
    17330682, -- Kindred Paladin
    17330683, -- Kindred Dark Knight
    17330684, -- Kindred Ranger

    17330686, -- Kindred White Mage
    17330687, -- Kindred Black Mage
    17330688, -- Kindred Red Mage
    17330689, -- Kindred Bard
    17330691, -- Kindred Samurai
    17330692, -- Kindred Ninja
    17330693, -- Kindred Dragoon
    17330695, -- Kindred Summoner
    17330697, -- Kindred Samurai
    17330698, -- Kindred Ninja
    17330699, -- Kindred Dragoon
    17330701, -- Kindred Summoner
    17330703, -- Kindred Paladin
    17330704, -- Kindred Paladin
    17330705, -- Kindred Dark Knight
    17330706, -- Kindred Dark Knight
    17330707, -- Kindred Bard
    17330708, -- Kindred Ninja
    17330709, -- Kindred Ninja
    17330710, -- Kindred Dragoon
    17330712, -- Kindred Dark Knight
    17330713, -- Kindred Black Mage
    17330714, -- Kindred Summoner
    17330716, -- Kindred Summoner
    17330719, -- Kindred Ranger
    17330720, -- Kindred Ranger
    17330721, -- Kindred Warrior
    17330722, -- Kindred Monk
    17330723, -- Kindred Monk
    17330724, -- Kindred Samurai
    17330725, -- Kindred Samurai
    17330726, -- Kindred Bard
    17330727, -- Kindred Bard
    17330728, -- Kindred Red Mage
    17330729, -- Kindred Thief
    17330730, -- Kindred Thief
    17330732, -- Kindred Warrior
    17330733, -- Kindred White Mage
    17330734, -- Kindred Beastmaster
    17330736, -- Kindred Beastmaster
    17330738, -- Kindred Bard
    17330739, -- Kindred Samurai
    17330740, -- Kindred Ninja
    17330741, -- Kindred Ninja
    17330742, -- Kindred Thief
    17330743, -- Kindred Ranger
    17330744, -- Kindred Dragoon
    17330747, -- Kindred Thief
    17330748, -- Kindred Ranger
    17330750, -- Kindred Warrior
    17330751, -- Kindred Monk
    17330752, -- Kindred White Mage
    17330753, -- Kindred Black Mage
    17330754, -- Kindred Red Mage
    17330755, -- Kindred Thief
    17330757, -- Kindred Paladin
    17330758, -- Kindred Dark Knight
    17330759, -- Kindred Beastmaster
    17330761, -- Kindred Bard
    17330763, -- Kindred Ranger
    17330764, -- Kindred Samurai
    17330765, -- Kindred Ninja
    17330766, -- Kindred Dragoon
    17330768, -- Kindred Summoner
}

xi.qr_dynamis.eye =
{
    NONE    = 0,
    RED     = 1,
    BLUE    = 2,
    GREEN   = 3,
}

xi.qr_dynamis.stones = {
    {luaPath="xi.zones.Dynamis-Bastok.mobs.Adamantking_Effigy", spawnList=xi.qr_dynamis.bastyList},
    {luaPath="xi.zones.Dynamis-Beaucedine.mobs.Adamantking_Effigy", spawnList=xi.qr_dynamis.beaucedineQuadavList},
    {luaPath="xi.zones.Dynamis-Beaucedine.mobs.Goblin_Statue", spawnList=xi.qr_dynamis.beaucedineGoblinList},
    {luaPath="xi.zones.Dynamis-Beaucedine.mobs.Avatar_Icon", spawnList=xi.qr_dynamis.beaucedineYagudoList},
    {luaPath="xi.zones.Dynamis-Beaucedine.mobs.Serjeant_Tombstone", spawnList=xi.qr_dynamis.beaucedineOrcishList},
    {luaPath="xi.zones.Dynamis-Buburimu.mobs.Adamantking_Effigy", spawnList=nil},
    {luaPath="xi.zones.Dynamis-Buburimu.mobs.Manifest_Icon", spawnList=nil},
    {luaPath="xi.zones.Dynamis-Buburimu.mobs.Goblin_Replica", spawnList=nil},
    {luaPath="xi.zones.Dynamis-Buburimu.mobs.Serjeant_Tombstone", spawnList=nil},
    {luaPath="xi.zones.Dynamis-Jeuno.mobs.Goblin_Statue", spawnList=xi.qr_dynamis.jeunoList},
    {luaPath="xi.zones.Dynamis-Qufim.mobs.Adamantking_Effigy", spawnList=nil},
    {luaPath="xi.zones.Dynamis-Qufim.mobs.Manifest_Icon", spawnList=nil},
    {luaPath="xi.zones.Dynamis-Qufim.mobs.Goblin_Replica", spawnList=nil},
    {luaPath="xi.zones.Dynamis-Qufim.mobs.Serjeant_Tombstone", spawnList=nil},
    {luaPath="xi.zones.Dynamis-San_dOria.mobs.Serjeant_Tombstone", spawnList=xi.qr_dynamis.sandyList},
    {luaPath="xi.zones.Dynamis-Tavnazia.mobs.Adamantking_Effigy", spawnList=nil},
    {luaPath="xi.zones.Dynamis-Tavnazia.mobs.Manifest_Icon", spawnList=nil},
    {luaPath="xi.zones.Dynamis-Tavnazia.mobs.Goblin_Replica", spawnList=nil},
    {luaPath="xi.zones.Dynamis-Tavnazia.mobs.Serjeant_Tombstone", spawnList=nil},
    {luaPath="xi.zones.Dynamis-Valkurm.mobs.Adamantking_Effigy", spawnList=nil},
    {luaPath="xi.zones.Dynamis-Valkurm.mobs.Manifest_Icon", spawnList=nil},
    {luaPath="xi.zones.Dynamis-Valkurm.mobs.Goblin_Replica", spawnList=nil},
    {luaPath="xi.zones.Dynamis-Valkurm.mobs.Serjeant_Tombstone", spawnList=nil},
    {luaPath="xi.zones.Dynamis-Windurst.mobs.Avatar_Icon", spawnList=xi.qr_dynamis.windyList},
    {luaPath="xi.zones.Dynamis-Xarcabard.mobs.Adamantking_Effigy", spawnList=nil},
    {luaPath="xi.zones.Dynamis-Xarcabard.mobs.Goblin_Replica", spawnList=nil},
    {luaPath="xi.zones.Dynamis-Xarcabard.mobs.Avatar_Icon", spawnList=nil},
    {luaPath="xi.zones.Dynamis-Xarcabard.mobs.Serjeant_Tombstone", spawnList=nil},
}

xi.qr_dynamis.zones = {
    "xi.zones.Dynamis-San_dOria.Zone",
    "xi.zones.Dynamis-Tavnazia.Zone",
    "xi.zones.Dynamis-Xarcabard.Zone",
    "xi.zones.Dynamis-Bastok.Zone",
    "xi.zones.Dynamis-Windurst.Zone",
    "xi.zones.Dynamis-Jeuno.Zone",
    "xi.zones.Dynamis-Buburimu.Zone",
    "xi.zones.Dynamis-Valkurm.Zone",
    "xi.zones.Dynamis-Beaucedine.Zone",
    "xi.zones.Dynamis-Qufim.Zone",
}

xi.qr_dynamis.entryNpcs = {
    {luaPath="xi.zones.Valkurm_Dunes.npcs.Hieroglyphics", enabled=true},
    {luaPath="xi.zones.Buburimu_Peninsula.npcs.Hieroglyphics", enabled=false},
    {luaPath="xi.zones.Tavnazian_Safehold.npcs.Hieroglyphics", enabled=false},
    {luaPath="xi.zones.Beaucedine_Glacier.npcs.Trail_Markings", enabled=true},
    {luaPath="xi.zones.RuLude_Gardens.npcs.Trail_Markings", enabled=true},
    {luaPath="xi.zones.Xarcabard.npcs.Trail_Markings", enabled=true},
    {luaPath="xi.zones.Southern_San_dOria.npcs.Trail_Markings", enabled=true},
    {luaPath="xi.zones.Qufim_Island.npcs.Hieroglyphics", enabled=false},
    {luaPath="xi.zones.Bastok_Mines.npcs.Trail_Markings", enabled=true},
    {luaPath="xi.zones.Windurst_Walls.npcs.Trail_Markings", enabled=true},
}

xi.qr_dynamis.entryInfo =
{
    --[[
    [zone] =
    {
        csBit    = the bit in the Dynamis_Status player variable that records whether player has beaten this dynamis
                   this bit number is also given to the start Dynamis event and message.
        csVial   = event ID for cutscene where Cornelia gives you the vial of shrouded sand
        csBeat   = event ID for cutscene after you have beaten this Dynamis
        csMenu   = event ID for entering Dynamis
        beatVar  = variable used to denote players who have beaten this Dynamis, but not yet viewed the cutscene
        beatKI   = key item given as reward for this Dynamis
        enterPos = coordinates where player will be placed when entering this Dynamis
        reqs     = function that returns true if player meets requirements for entering this Dynamis
                   minimum level and timer are checked separately
    }
    --]]

    [xi.zone.SOUTHERN_SAN_DORIA] =
    {
        csBit = 1,
        csVial = 686,
        csFirst = 692,
        csBeat = 698,
        csMenu = 961,
        beatVar = "DynaSandoria_Win",
        beatKI = xi.ki.HYDRA_CORPS_COMMAND_SCEPTER,
        enterPos = {161.838, -2.000, 161.673, 93, 185},
    },

    [xi.zone.BASTOK_MINES] =
    {
        csBit = 2,
        csVial = 203,
        csFirst = 209,
        csBeat = 215,
        csMenu = 597,
        beatVar = "DynaBastok_Win",
        beatKI = xi.ki.HYDRA_CORPS_EYEGLASS,
        enterPos = {116.482, 0.994, -72.121, 128, 186},
    },

    [xi.zone.WINDURST_WALLS] =
    {
        csBit = 3,
        csVial = 455,
        csFirst = 459,
        csBeat = 465,
        csMenu = 513,
        beatVar = "DynaWindurst_Win",
        beatKI = xi.ki.HYDRA_CORPS_LANTERN,
        enterPos = {-221.988, 1.000, -120.184, 0, 187},
    },

    [xi.zone.RULUDE_GARDENS] =
    {
        csBit = 4,
        csVial = 10016,
        csFirst = 10020,
        csBeat = 10026,
        csMenu = 10176,
        beatVar = "DynaJeuno_Win",
        beatKI = xi.ki.HYDRA_CORPS_TACTICAL_MAP,
        enterPos = {48.930, 10.002, -71.032, 195, 188},
    },

    [xi.zone.BEAUCEDINE_GLACIER] =
    {
        csBit = 5,
        csFirst = 128,
        csBeat = 134,
        csMenu = 229,
        beatVar = "DynaBeaucedine_Win",
        beatKI = xi.ki.HYDRA_CORPS_INSIGNIA,
        enterPos = {-284.751, -39.923, -422.948, 235, 134},
        reqs = function(player)
            return player:hasKeyItem(xi.ki.HYDRA_CORPS_COMMAND_SCEPTER) and
                    player:hasKeyItem(xi.ki.HYDRA_CORPS_EYEGLASS) and
                    player:hasKeyItem(xi.ki.HYDRA_CORPS_LANTERN) and
                    player:hasKeyItem(xi.ki.HYDRA_CORPS_TACTICAL_MAP)
        end,
    },

    [xi.zone.XARCABARD] =
    {
        csBit = 6,
        csFirst = 26,
        csBeat = 32,
        csMenu = 205,
        beatVar = "DynaXarcabard_Win",
        beatKI = xi.ki.HYDRA_CORPS_BATTLE_STANDARD,
        enterPos = {569.312, -0.098, -270.158, 90, 135},
        reqs = function(player) return player:hasKeyItem(xi.ki.HYDRA_CORPS_INSIGNIA) end,
    },

    -- TODO: Make absolutely sure that winning Xarcabard does NOT allow early access to dreamlands BEFORE CoP 3-5
    [xi.zone.VALKURM_DUNES] =
    {
        csBit = 7,
        csFirst = 33,
        csBeat = 39,
        csMenu = 58,
        beatVar = "DynaValkurm_Win",
        beatKI = xi.ki.DYNAMIS_VALKURM_SLIVER,
        enterPos = {100, -8, 131, 47, 39},
        reqs = function(player)
            return (
                    player:hasCompletedMission(xi.mission.log_id.COP, xi.mission.id.cop.DARKNESS_NAMED) or
                            xi.settings.FREE_COP_DYNAMIS == 1
            )
        end,
    },

    [xi.zone.BUBURIMU_PENINSULA] =
    {
        csBit = 8,
        csFirst = 40,
        csBeat = 46,
        csMenu = 64,
        beatVar = "DynaBuburimu_Win",
        beatKI = xi.ki.DYNAMIS_BUBURIMU_SLIVER,
        enterPos = {155, -1, -169, 170, 40},
        reqs = function(player)
            return (
                    player:hasCompletedMission(xi.mission.log_id.COP, xi.mission.id.cop.DARKNESS_NAMED) or
                            xi.settings.FREE_COP_DYNAMIS == 1
            )
        end,
    },

    [xi.zone.QUFIM_ISLAND] =
    {
        csBit = 9,
        csFirst = 22,
        csBeat = 28,
        csMenu = 48,
        beatVar = "DynaQufim_Win",
        beatKI = xi.ki.DYNAMIS_QUFIM_SLIVER,
        enterPos = {-19, -17, 104, 253, 41},
        reqs = function(player)
            return (
                    player:hasCompletedMission(xi.mission.log_id.COP, xi.mission.id.cop.DARKNESS_NAMED) or
                            xi.settings.FREE_COP_DYNAMIS == 1
            )
        end,
    },

    [xi.zone.TAVNAZIAN_SAFEHOLD] =
    {
        csBit = 10,
        csFirst = 614,
        -- TODO: Tavnazian winning CS changes Param2 (part of dialogue) depending on CoP progress ranging from 0 ("she will pay dearly") up to 3 ("you know this girl well")
        --       The exact mission breaking points for each bit need captures or testimonies; Param1 seems to be 0 or garbage
        csBeat = 615,
        csMenu = 624,
        beatVar = "DynaTavnazia_Win",
        beatKI = xi.ki.DYNAMIS_TAVNAZIA_SLIVER,
        enterPos = {0.1, -7, -21, 190, 42},
        reqs = function(player)
            return player:hasKeyItem(xi.ki.DYNAMIS_BUBURIMU_SLIVER) and
                    player:hasKeyItem(xi.ki.DYNAMIS_QUFIM_SLIVER) and
                    player:hasKeyItem(xi.ki.DYNAMIS_VALKURM_SLIVER)
        end,
    },
}