// Auto-generated. Do not edit!

// (in-package assignment3.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;

//-----------------------------------------------------------

class Feedback {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.action_success = null;
    }
    else {
      if (initObj.hasOwnProperty('action_success')) {
        this.action_success = initObj.action_success
      }
      else {
        this.action_success = false;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type Feedback
    // Serialize message field [action_success]
    bufferOffset = _serializer.bool(obj.action_success, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type Feedback
    let len;
    let data = new Feedback(null);
    // Deserialize message field [action_success]
    data.action_success = _deserializer.bool(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 1;
  }

  static datatype() {
    // Returns string type for a message object
    return 'assignment3/Feedback';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'f80c0f2f2bc7be57a86c32c39edc051b';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    bool action_success
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new Feedback(null);
    if (msg.action_success !== undefined) {
      resolved.action_success = msg.action_success;
    }
    else {
      resolved.action_success = false
    }

    return resolved;
    }
};

module.exports = Feedback;
