# This Python file uses the following encoding: utf-8
"""autogenerated by genpy from assignment3/Goals.msg. Do not edit."""
import codecs
import sys
python3 = True if sys.hexversion > 0x03000000 else False
import genpy
import struct

import assignment3.msg
import geometry_msgs.msg

class Goals(genpy.Message):
  _md5sum = "3b0a5f299fb224ecfcef24f4184c3f6d"
  _type = "assignment3/Goals"
  _has_header = False  # flag to mark the presence of a Header object
  _full_text = """Goal[] primary_goals
Goal[] secondary_goals

================================================================================
MSG: assignment3/Goal
string description
int32 priority
geometry_msgs/Point[] waypoints

================================================================================
MSG: geometry_msgs/Point
# This contains the position of a point in free space
float64 x
float64 y
float64 z
"""
  __slots__ = ['primary_goals','secondary_goals']
  _slot_types = ['assignment3/Goal[]','assignment3/Goal[]']

  def __init__(self, *args, **kwds):
    """
    Constructor. Any message fields that are implicitly/explicitly
    set to None will be assigned a default value. The recommend
    use is keyword arguments as this is more robust to future message
    changes.  You cannot mix in-order arguments and keyword arguments.

    The available fields are:
       primary_goals,secondary_goals

    :param args: complete set of field values, in .msg order
    :param kwds: use keyword arguments corresponding to message field names
    to set specific fields.
    """
    if args or kwds:
      super(Goals, self).__init__(*args, **kwds)
      # message fields cannot be None, assign default values for those that are
      if self.primary_goals is None:
        self.primary_goals = []
      if self.secondary_goals is None:
        self.secondary_goals = []
    else:
      self.primary_goals = []
      self.secondary_goals = []

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
      length = len(self.primary_goals)
      buff.write(_struct_I.pack(length))
      for val1 in self.primary_goals:
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
      length = len(self.secondary_goals)
      buff.write(_struct_I.pack(length))
      for val1 in self.secondary_goals:
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
      if self.primary_goals is None:
        self.primary_goals = None
      if self.secondary_goals is None:
        self.secondary_goals = None
      end = 0
      start = end
      end += 4
      (length,) = _struct_I.unpack(str[start:end])
      self.primary_goals = []
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
        self.primary_goals.append(val1)
      start = end
      end += 4
      (length,) = _struct_I.unpack(str[start:end])
      self.secondary_goals = []
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
        self.secondary_goals.append(val1)
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
      length = len(self.primary_goals)
      buff.write(_struct_I.pack(length))
      for val1 in self.primary_goals:
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
      length = len(self.secondary_goals)
      buff.write(_struct_I.pack(length))
      for val1 in self.secondary_goals:
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
      if self.primary_goals is None:
        self.primary_goals = None
      if self.secondary_goals is None:
        self.secondary_goals = None
      end = 0
      start = end
      end += 4
      (length,) = _struct_I.unpack(str[start:end])
      self.primary_goals = []
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
        self.primary_goals.append(val1)
      start = end
      end += 4
      (length,) = _struct_I.unpack(str[start:end])
      self.secondary_goals = []
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
        self.secondary_goals.append(val1)
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
