// Auto-generated. Do not edit!

// (in-package assignment3.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;
let Map = require('./Map.js');
let geometry_msgs = _finder('geometry_msgs');

//-----------------------------------------------------------

class State {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.current_position = null;
      this.environment_map = null;
    }
    else {
      if (initObj.hasOwnProperty('current_position')) {
        this.current_position = initObj.current_position
      }
      else {
        this.current_position = new geometry_msgs.msg.Point();
      }
      if (initObj.hasOwnProperty('environment_map')) {
        this.environment_map = initObj.environment_map
      }
      else {
        this.environment_map = new Map();
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type State
    // Serialize message field [current_position]
    bufferOffset = geometry_msgs.msg.Point.serialize(obj.current_position, buffer, bufferOffset);
    // Serialize message field [environment_map]
    bufferOffset = Map.serialize(obj.environment_map, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type State
    let len;
    let data = new State(null);
    // Deserialize message field [current_position]
    data.current_position = geometry_msgs.msg.Point.deserialize(buffer, bufferOffset);
    // Deserialize message field [environment_map]
    data.environment_map = Map.deserialize(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += Map.getMessageSize(object.environment_map);
    return length + 24;
  }

  static datatype() {
    // Returns string type for a message object
    return 'assignment3/State';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '9ed7a5ab0f77624d96ff4cc104c195a8';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
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
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new State(null);
    if (msg.current_position !== undefined) {
      resolved.current_position = geometry_msgs.msg.Point.Resolve(msg.current_position)
    }
    else {
      resolved.current_position = new geometry_msgs.msg.Point()
    }

    if (msg.environment_map !== undefined) {
      resolved.environment_map = Map.Resolve(msg.environment_map)
    }
    else {
      resolved.environment_map = new Map()
    }

    return resolved;
    }
};

module.exports = State;
