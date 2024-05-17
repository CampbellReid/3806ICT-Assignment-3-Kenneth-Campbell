# This Python file uses the following encoding: utf-8
"""autogenerated by genpy from assignment3/CreatePlanRequest.msg. Do not edit."""
import codecs
import sys
python3 = True if sys.hexversion > 0x03000000 else False
import genpy
import struct

import assignment3.msg
import geometry_msgs.msg

class CreatePlanRequest(genpy.Message):
  _md5sum = "26f4b76bd097e1b1edcbe52b3102526a"
  _type = "assignment3/CreatePlanRequest"
  _has_header = False  # flag to mark the presence of a Header object
  _full_text = """State state
Goals goals

================================================================================
MSG: assignment3/State
geometry_msgs/Point current_position
Map environment_map

================================================================================
MSG: geometry_msgs/Point
# This contains the position of a point in free space
float64 x
float64 y
float64 z

================================================================================
MSG: assignment3/Map
geometry_msgs/Point[] obstacle_positions

================================================================================
MSG: assignment3/Goals
Goal[] primary_goals
Goal[] secondary_goals

================================================================================
MSG: assignment3/Goal
string description
int32 priority
geometry_msgs/Point[] waypoints
"""
  __slots__ = ['state','goals']
  _slot_types = ['assignment3/State','assignment3/Goals']

  def __init__(self, *args, **kwds):
    """
    Constructor. Any message fields that are implicitly/explicitly
    set to None will be assigned a default value. The recommend
    use is keyword arguments as this is more robust to future message
    changes.  You cannot mix in-order arguments and keyword arguments.

    The available fields are:
       state,goals

    :param args: complete set of field values, in .msg order
    :param kwds: use keyword arguments corresponding to message field names
    to set specific fields.
    """
    if args or kwds:
      super(CreatePlanRequest, self).__init__(*args, **kwds)
      # message fields cannot be None, assign default values for those that are
      if self.state is None:
        self.state = assignment3.msg.State()
      if self.goals is None:
        self.goals = assignment3.msg.Goals()
    else:
      self.state = assignment3.msg.State()
      self.goals = assignment3.msg.Goals()

  def _get_types(self):
    """
    internal API method
    """
    return self._slot_types

  def serialize(self, buff):
    """
    serialize message into buffer
    :param buff: buffer, ``StringIO``
    """
    try:
      _x = self
      buff.write(_get_struct_3d().pack(_x.state.current_position.x, _x.state.current_position.y, _x.state.current_position.z))
      length = len(self.state.environment_map.obstacle_positions)
      buff.write(_struct_I.pack(length))
      for val1 in self.state.environment_map.obstacle_positions:
        _x = val1
        buff.write(_get_struct_3d().pack(_x.x, _x.y, _x.z))
      length = len(self.goals.primary_goals)
      buff.write(_struct_I.pack(length))
      for val1 in self.goals.primary_goals:
        _x = val1.description
        length = len(_x)
        if python3 or type(_x) == unicode:
          _x = _x.encode('utf-8')
          length = len(_x)
        buff.write(struct.Struct('<I%ss'%length).pack(length, _x))
        _x = val1.priority
        buff.write(_get_struct_i().pack(_x))
        length = len(val1.waypoints)
        buff.write(_struct_I.pack(length))
        for val2 in val1.waypoints:
          _x = val2
          buff.write(_get_struct_3d().pack(_x.x, _x.y, _x.z))
      length = len(self.goals.secondary_goals)
      buff.write(_struct_I.pack(length))
      for val1 in self.goals.secondary_goals:
        _x = val1.description
        length = len(_x)
        if python3 or type(_x) == unicode:
          _x = _x.encode('utf-8')
          length = len(_x)
        buff.write(struct.Struct('<I%ss'%length).pack(length, _x))
        _x = val1.priority
        buff.write(_get_struct_i().pack(_x))
        length = len(val1.waypoints)
        buff.write(_struct_I.pack(length))
        for val2 in val1.waypoints:
          _x = val2
          buff.write(_get_struct_3d().pack(_x.x, _x.y, _x.z))
    except struct.error as se: self._check_types(struct.error("%s: '%s' when writing '%s'" % (type(se), str(se), str(locals().get('_x', self)))))
    except TypeError as te: self._check_types(ValueError("%s: '%s' when writing '%s'" % (type(te), str(te), str(locals().get('_x', self)))))

  def deserialize(self, str):
    """
    unpack serialized message in str into this message instance
    :param str: byte array of serialized message, ``str``
    """
    if python3:
      codecs.lookup_error("rosmsg").msg_type = self._type
    try:
      if self.state is None:
        self.state = assignment3.msg.State()
      if self.goals is None:
        self.goals = assignment3.msg.Goals()
      end = 0
      _x = self
      start = end
      end += 24
      (_x.state.current_position.x, _x.state.current_position.y, _x.state.current_position.z,) = _get_struct_3d().unpack(str[start:end])
      start = end
      end += 4
      (length,) = _struct_I.unpack(str[start:end])
      self.state.environment_map.obstacle_positions = []
      for i in range(0, length):
        val1 = geometry_msgs.msg.Point()
        _x = val1
        start = end
        end += 24
        (_x.x, _x.y, _x.z,) = _get_struct_3d().unpack(str[start:end])
        self.state.environment_map.obstacle_positions.append(val1)
      start = end
      end += 4
      (length,) = _struct_I.unpack(str[start:end])
      self.goals.primary_goals = []
      for i in range(0, length):
        val1 = assignment3.msg.Goal()
        start = end
        end += 4
        (length,) = _struct_I.unpack(str[start:end])
        start = end
        end += length
        if python3:
          val1.description = str[start:end].decode('utf-8', 'rosmsg')
        else:
          val1.description = str[start:end]
        start = end
        end += 4
        (val1.priority,) = _get_struct_i().unpack(str[start:end])
        start = end
        end += 4
        (length,) = _struct_I.unpack(str[start:end])
        val1.waypoints = []
        for i in range(0, length):
          val2 = geometry_msgs.msg.Point()
          _x = val2
          start = end
          end += 24
          (_x.x, _x.y, _x.z,) = _get_struct_3d().unpack(str[start:end])
          val1.waypoints.append(val2)
        self.goals.primary_goals.append(val1)
      start = end
      end += 4
      (length,) = _struct_I.unpack(str[start:end])
      self.goals.secondary_goals = []
      for i in range(0, length):
        val1 = assignment3.msg.Goal()
        start = end
        end += 4
        (length,) = _struct_I.unpack(str[start:end])
        start = end
        end += length
        if python3:
          val1.description = str[start:end].decode('utf-8', 'rosmsg')
        else:
          val1.description = str[start:end]
        start = end
        end += 4
        (val1.priority,) = _get_struct_i().unpack(str[start:end])
        start = end
        end += 4
        (length,) = _struct_I.unpack(str[start:end])
        val1.waypoints = []
        for i in range(0, length):
          val2 = geometry_msgs.msg.Point()
          _x = val2
          start = end
          end += 24
          (_x.x, _x.y, _x.z,) = _get_struct_3d().unpack(str[start:end])
          val1.waypoints.append(val2)
        self.goals.secondary_goals.append(val1)
      return self
    except struct.error as e:
      raise genpy.DeserializationError(e)  # most likely buffer underfill


  def serialize_numpy(self, buff, numpy):
    """
    serialize message with numpy array types into buffer
    :param buff: buffer, ``StringIO``
    :param numpy: numpy python module
    """
    try:
      _x = self
      buff.write(_get_struct_3d().pack(_x.state.current_position.x, _x.state.current_position.y, _x.state.current_position.z))
      length = len(self.state.environment_map.obstacle_positions)
      buff.write(_struct_I.pack(length))
      for val1 in self.state.environment_map.obstacle_positions:
        _x = val1
        buff.write(_get_struct_3d().pack(_x.x, _x.y, _x.z))
      length = len(self.goals.primary_goals)
      buff.write(_struct_I.pack(length))
      for val1 in self.goals.primary_goals:
        _x = val1.description
        length = len(_x)
        if python3 or type(_x) == unicode:
          _x = _x.encode('utf-8')
          length = len(_x)
        buff.write(struct.Struct('<I%ss'%length).pack(length, _x))
        _x = val1.priority
        buff.write(_get_struct_i().pack(_x))
        length = len(val1.waypoints)
        buff.write(_struct_I.pack(length))
        for val2 in val1.waypoints:
          _x = val2
          buff.write(_get_struct_3d().pack(_x.x, _x.y, _x.z))
      length = len(self.goals.secondary_goals)
      buff.write(_struct_I.pack(length))
      for val1 in self.goals.secondary_goals:
        _x = val1.description
        length = len(_x)
        if python3 or type(_x) == unicode:
          _x = _x.encode('utf-8')
          length = len(_x)
        buff.write(struct.Struct('<I%ss'%length).pack(length, _x))
        _x = val1.priority
        buff.write(_get_struct_i().pack(_x))
        length = len(val1.waypoints)
        buff.write(_struct_I.pack(length))
        for val2 in val1.waypoints:
          _x = val2
          buff.write(_get_struct_3d().pack(_x.x, _x.y, _x.z))
    except struct.error as se: self._check_types(struct.error("%s: '%s' when writing '%s'" % (type(se), str(se), str(locals().get('_x', self)))))
    except TypeError as te: self._check_types(ValueError("%s: '%s' when writing '%s'" % (type(te), str(te), str(locals().get('_x', self)))))

  def deserialize_numpy(self, str, numpy):
    """
    unpack serialized message in str into this message instance using numpy for array types
    :param str: byte array of serialized message, ``str``
    :param numpy: numpy python module
    """
    if python3:
      codecs.lookup_error("rosmsg").msg_type = self._type
    try:
      if self.state is None:
        self.state = assignment3.msg.State()
      if self.goals is None:
        self.goals = assignment3.msg.Goals()
      end = 0
      _x = self
      start = end
      end += 24
      (_x.state.current_position.x, _x.state.current_position.y, _x.state.current_position.z,) = _get_struct_3d().unpack(str[start:end])
      start = end
      end += 4
      (length,) = _struct_I.unpack(str[start:end])
      self.state.environment_map.obstacle_positions = []
      for i in range(0, length):
        val1 = geometry_msgs.msg.Point()
        _x = val1
        start = end
        end += 24
        (_x.x, _x.y, _x.z,) = _get_struct_3d().unpack(str[start:end])
        self.state.environment_map.obstacle_positions.append(val1)
      start = end
      end += 4
      (length,) = _struct_I.unpack(str[start:end])
      self.goals.primary_goals = []
      for i in range(0, length):
        val1 = assignment3.msg.Goal()
        start = end
        end += 4
        (length,) = _struct_I.unpack(str[start:end])
        start = end
        end += length
        if python3:
          val1.description = str[start:end].decode('utf-8', 'rosmsg')
        else:
          val1.description = str[start:end]
        start = end
        end += 4
        (val1.priority,) = _get_struct_i().unpack(str[start:end])
        start = end
        end += 4
        (length,) = _struct_I.unpack(str[start:end])
        val1.waypoints = []
        for i in range(0, length):
          val2 = geometry_msgs.msg.Point()
          _x = val2
          start = end
          end += 24
          (_x.x, _x.y, _x.z,) = _get_struct_3d().unpack(str[start:end])
          val1.waypoints.append(val2)
        self.goals.primary_goals.append(val1)
      start = end
      end += 4
      (length,) = _struct_I.unpack(str[start:end])
      self.goals.secondary_goals = []
      for i in range(0, length):
        val1 = assignment3.msg.Goal()
        start = end
        end += 4
        (length,) = _struct_I.unpack(str[start:end])
        start = end
        end += length
        if python3:
          val1.description = str[start:end].decode('utf-8', 'rosmsg')
        else:
          val1.description = str[start:end]
        start = end
        end += 4
        (val1.priority,) = _get_struct_i().unpack(str[start:end])
        start = end
        end += 4
        (length,) = _struct_I.unpack(str[start:end])
        val1.waypoints = []
        for i in range(0, length):
          val2 = geometry_msgs.msg.Point()
          _x = val2
          start = end
          end += 24
          (_x.x, _x.y, _x.z,) = _get_struct_3d().unpack(str[start:end])
          val1.waypoints.append(val2)
        self.goals.secondary_goals.append(val1)
      return self
    except struct.error as e:
      raise genpy.DeserializationError(e)  # most likely buffer underfill

_struct_I = genpy.struct_I
def _get_struct_I():
    global _struct_I
    return _struct_I
_struct_3d = None
def _get_struct_3d():
    global _struct_3d
    if _struct_3d is None:
        _struct_3d = struct.Struct("<3d")
    return _struct_3d
_struct_i = None
def _get_struct_i():
    global _struct_i
    if _struct_i is None:
        _struct_i = struct.Struct("<i")
    return _struct_i
# This Python file uses the following encoding: utf-8
"""autogenerated by genpy from assignment3/CreatePlanResponse.msg. Do not edit."""
import codecs
import sys
python3 = True if sys.hexversion > 0x03000000 else False
import genpy
import struct

import assignment3.msg
import geometry_msgs.msg

class CreatePlanResponse(genpy.Message):
  _md5sum = "b47c1e2e43b70f5255aaf39cf4bfdf46"
  _type = "assignment3/CreatePlanResponse"
  _has_header = False  # flag to mark the presence of a Header object
  _full_text = """Plan plan


================================================================================
MSG: assignment3/Plan
Waypoint[] waypoints

================================================================================
MSG: assignment3/Waypoint
geometry_msgs/Point position

================================================================================
MSG: geometry_msgs/Point
# This contains the position of a point in free space
float64 x
float64 y
float64 z
"""
  __slots__ = ['plan']
  _slot_types = ['assignment3/Plan']

  def __init__(self, *args, **kwds):
    """
    Constructor. Any message fields that are implicitly/explicitly
    set to None will be assigned a default value. The recommend
    use is keyword arguments as this is more robust to future message
    changes.  You cannot mix in-order arguments and keyword arguments.

    The available fields are:
       plan

    :param args: complete set of field values, in .msg order
    :param kwds: use keyword arguments corresponding to message field names
    to set specific fields.
    """
    if args or kwds:
      super(CreatePlanResponse, self).__init__(*args, **kwds)
      # message fields cannot be None, assign default values for those that are
      if self.plan is None:
        self.plan = assignment3.msg.Plan()
    else:
      self.plan = assignment3.msg.Plan()

  def _get_types(self):
    """
    internal API method
    """
    return self._slot_types

  def serialize(self, buff):
    """
    serialize message into buffer
    :param buff: buffer, ``StringIO``
    """
    try:
      length = len(self.plan.waypoints)
      buff.write(_struct_I.pack(length))
      for val1 in self.plan.waypoints:
        _v1 = val1.position
        _x = _v1
        buff.write(_get_struct_3d().pack(_x.x, _x.y, _x.z))
    except struct.error as se: self._check_types(struct.error("%s: '%s' when writing '%s'" % (type(se), str(se), str(locals().get('_x', self)))))
    except TypeError as te: self._check_types(ValueError("%s: '%s' when writing '%s'" % (type(te), str(te), str(locals().get('_x', self)))))

  def deserialize(self, str):
    """
    unpack serialized message in str into this message instance
    :param str: byte array of serialized message, ``str``
    """
    if python3:
      codecs.lookup_error("rosmsg").msg_type = self._type
    try:
      if self.plan is None:
        self.plan = assignment3.msg.Plan()
      end = 0
      start = end
      end += 4
      (length,) = _struct_I.unpack(str[start:end])
      self.plan.waypoints = []
      for i in range(0, length):
        val1 = assignment3.msg.Waypoint()
        _v2 = val1.position
        _x = _v2
        start = end
        end += 24
        (_x.x, _x.y, _x.z,) = _get_struct_3d().unpack(str[start:end])
        self.plan.waypoints.append(val1)
      return self
    except struct.error as e:
      raise genpy.DeserializationError(e)  # most likely buffer underfill


  def serialize_numpy(self, buff, numpy):
    """
    serialize message with numpy array types into buffer
    :param buff: buffer, ``StringIO``
    :param numpy: numpy python module
    """
    try:
      length = len(self.plan.waypoints)
      buff.write(_struct_I.pack(length))
      for val1 in self.plan.waypoints:
        _v3 = val1.position
        _x = _v3
        buff.write(_get_struct_3d().pack(_x.x, _x.y, _x.z))
    except struct.error as se: self._check_types(struct.error("%s: '%s' when writing '%s'" % (type(se), str(se), str(locals().get('_x', self)))))
    except TypeError as te: self._check_types(ValueError("%s: '%s' when writing '%s'" % (type(te), str(te), str(locals().get('_x', self)))))

  def deserialize_numpy(self, str, numpy):
    """
    unpack serialized message in str into this message instance using numpy for array types
    :param str: byte array of serialized message, ``str``
    :param numpy: numpy python module
    """
    if python3:
      codecs.lookup_error("rosmsg").msg_type = self._type
    try:
      if self.plan is None:
        self.plan = assignment3.msg.Plan()
      end = 0
      start = end
      end += 4
      (length,) = _struct_I.unpack(str[start:end])
      self.plan.waypoints = []
      for i in range(0, length):
        val1 = assignment3.msg.Waypoint()
        _v4 = val1.position
        _x = _v4
        start = end
        end += 24
        (_x.x, _x.y, _x.z,) = _get_struct_3d().unpack(str[start:end])
        self.plan.waypoints.append(val1)
      return self
    except struct.error as e:
      raise genpy.DeserializationError(e)  # most likely buffer underfill

_struct_I = genpy.struct_I
def _get_struct_I():
    global _struct_I
    return _struct_I
_struct_3d = None
def _get_struct_3d():
    global _struct_3d
    if _struct_3d is None:
        _struct_3d = struct.Struct("<3d")
    return _struct_3d
class CreatePlan(object):
  _type          = 'assignment3/CreatePlan'
  _md5sum = 'f5bba44cc5e16145329a21e1c3c0c658'
  _request_class  = CreatePlanRequest
  _response_class = CreatePlanResponse
