// Auto-generated. Do not edit!

// (in-package assignment3.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;
let geometry_msgs = _finder('geometry_msgs');

//-----------------------------------------------------------

class Map {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.obstacle_positions = null;
    }
    else {
      if (initObj.hasOwnProperty('obstacle_positions')) {
        this.obstacle_positions = initObj.obstacle_positions
      }
      else {
        this.obstacle_positions = [];
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type Map
    // Serialize message field [obstacle_positions]
    // Serialize the length for message field [obstacle_positions]
    bufferOffset = _serializer.uint32(obj.obstacle_positions.length, buffer, bufferOffset);
    obj.obstacle_positions.forEach((val) => {
      bufferOffset = geometry_msgs.msg.Point.serialize(val, buffer, bufferOffset);
    });
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type Map
    let len;
    let data = new Map(null);
    // Deserialize message field [obstacle_positions]
    // Deserialize array length for message field [obstacle_positions]
    len = _deserializer.uint32(buffer, bufferOffset);
    data.obstacle_positions = new Array(len);
    for (let i = 0; i < len; ++i) {
      data.obstacle_positions[i] = geometry_msgs.msg.Point.deserialize(buffer, bufferOffset)
    }
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += 24 * object.obstacle_positions.length;
    return length + 4;
  }

  static datatype() {
    // Returns string type for a message object
    return 'assignment3/Map';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'e5fca51cc9da81dd3cbc4f12a389770c';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    geometry_msgs/Point[] obstacle_positions
    
    ================================================================================
    MSG: geometry_msgs/Point
    # This contains the position of a point in free space
    float64 x
    float64 y
    float64 z
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new Map(null);
    if (msg.obstacle_positions !== undefined) {
      resolved.obstacle_positions = new Array(msg.obstacle_positions.length);
      for (let i = 0; i < resolved.obstacle_positions.length; ++i) {
        resolved.obstacle_positions[i] = geometry_msgs.msg.Point.Resolve(msg.obstacle_positions[i]);
      }
    }
    else {
      resolved.obstacle_positions = []
    }

    return resolved;
    }
};

module.exports = Map;
