// Auto-generated. Do not edit!

// (in-package assignment3.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;
let Goal = require('./Goal.js');

//-----------------------------------------------------------

class Goals {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.primary_goals = null;
      this.secondary_goals = null;
    }
    else {
      if (initObj.hasOwnProperty('primary_goals')) {
        this.primary_goals = initObj.primary_goals
      }
      else {
        this.primary_goals = [];
      }
      if (initObj.hasOwnProperty('secondary_goals')) {
        this.secondary_goals = initObj.secondary_goals
      }
      else {
        this.secondary_goals = [];
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type Goals
    // Serialize message field [primary_goals]
    // Serialize the length for message field [primary_goals]
    bufferOffset = _serializer.uint32(obj.primary_goals.length, buffer, bufferOffset);
    obj.primary_goals.forEach((val) => {
      bufferOffset = Goal.serialize(val, buffer, bufferOffset);
    });
    // Serialize message field [secondary_goals]
    // Serialize the length for message field [secondary_goals]
    bufferOffset = _serializer.uint32(obj.secondary_goals.length, buffer, bufferOffset);
    obj.secondary_goals.forEach((val) => {
      bufferOffset = Goal.serialize(val, buffer, bufferOffset);
    });
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type Goals
    let len;
    let data = new Goals(null);
    // Deserialize message field [primary_goals]
    // Deserialize array length for message field [primary_goals]
    len = _deserializer.uint32(buffer, bufferOffset);
    data.primary_goals = new Array(len);
    for (let i = 0; i < len; ++i) {
      data.primary_goals[i] = Goal.deserialize(buffer, bufferOffset)
    }
    // Deserialize message field [secondary_goals]
    // Deserialize array length for message field [secondary_goals]
    len = _deserializer.uint32(buffer, bufferOffset);
    data.secondary_goals = new Array(len);
    for (let i = 0; i < len; ++i) {
      data.secondary_goals[i] = Goal.deserialize(buffer, bufferOffset)
    }
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    object.primary_goals.forEach((val) => {
      length += Goal.getMessageSize(val);
    });
    object.secondary_goals.forEach((val) => {
      length += Goal.getMessageSize(val);
    });
    return length + 8;
  }

  static datatype() {
    // Returns string type for a message object
    return 'assignment3/Goals';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '3b0a5f299fb224ecfcef24f4184c3f6d';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    Goal[] primary_goals
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
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new Goals(null);
    if (msg.primary_goals !== undefined) {
      resolved.primary_goals = new Array(msg.primary_goals.length);
      for (let i = 0; i < resolved.primary_goals.length; ++i) {
        resolved.primary_goals[i] = Goal.Resolve(msg.primary_goals[i]);
      }
    }
    else {
      resolved.primary_goals = []
    }

    if (msg.secondary_goals !== undefined) {
      resolved.secondary_goals = new Array(msg.secondary_goals.length);
      for (let i = 0; i < resolved.secondary_goals.length; ++i) {
        resolved.secondary_goals[i] = Goal.Resolve(msg.secondary_goals[i]);
      }
    }
    else {
      resolved.secondary_goals = []
    }

    return resolved;
    }
};

module.exports = Goals;
