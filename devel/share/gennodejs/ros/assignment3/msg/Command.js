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

class Command {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.target_position = null;
      this.target_speed = null;
    }
    else {
      if (initObj.hasOwnProperty('target_position')) {
        this.target_position = initObj.target_position
      }
      else {
        this.target_position = new geometry_msgs.msg.Point();
      }
      if (initObj.hasOwnProperty('target_speed')) {
        this.target_speed = initObj.target_speed
      }
      else {
        this.target_speed = 0.0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type Command
    // Serialize message field [target_position]
    bufferOffset = geometry_msgs.msg.Point.serialize(obj.target_position, buffer, bufferOffset);
    // Serialize message field [target_speed]
    bufferOffset = _serializer.float32(obj.target_speed, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type Command
    let len;
    let data = new Command(null);
    // Deserialize message field [target_position]
    data.target_position = geometry_msgs.msg.Point.deserialize(buffer, bufferOffset);
    // Deserialize message field [target_speed]
    data.target_speed = _deserializer.float32(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 28;
  }

  static datatype() {
    // Returns string type for a message object
    return 'assignment3/Command';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'b6e48e0f01c18d28e055fd89413db754';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    geometry_msgs/Point target_position
    float32 target_speed
    
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
    const resolved = new Command(null);
    if (msg.target_position !== undefined) {
      resolved.target_position = geometry_msgs.msg.Point.Resolve(msg.target_position)
    }
    else {
      resolved.target_position = new geometry_msgs.msg.Point()
    }

    if (msg.target_speed !== undefined) {
      resolved.target_speed = msg.target_speed;
    }
    else {
      resolved.target_speed = 0.0
    }

    return resolved;
    }
};

module.exports = Command;
