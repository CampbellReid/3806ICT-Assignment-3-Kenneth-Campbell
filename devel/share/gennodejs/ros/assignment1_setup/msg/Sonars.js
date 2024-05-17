// Auto-generated. Do not edit!

// (in-package assignment1_setup.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;

//-----------------------------------------------------------

class Sonars {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.distance0 = null;
      this.distance1 = null;
      this.distance2 = null;
    }
    else {
      if (initObj.hasOwnProperty('distance0')) {
        this.distance0 = initObj.distance0
      }
      else {
        this.distance0 = 0;
      }
      if (initObj.hasOwnProperty('distance1')) {
        this.distance1 = initObj.distance1
      }
      else {
        this.distance1 = 0;
      }
      if (initObj.hasOwnProperty('distance2')) {
        this.distance2 = initObj.distance2
      }
      else {
        this.distance2 = 0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type Sonars
    // Serialize message field [distance0]
    bufferOffset = _serializer.uint16(obj.distance0, buffer, bufferOffset);
    // Serialize message field [distance1]
    bufferOffset = _serializer.uint16(obj.distance1, buffer, bufferOffset);
    // Serialize message field [distance2]
    bufferOffset = _serializer.uint16(obj.distance2, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type Sonars
    let len;
    let data = new Sonars(null);
    // Deserialize message field [distance0]
    data.distance0 = _deserializer.uint16(buffer, bufferOffset);
    // Deserialize message field [distance1]
    data.distance1 = _deserializer.uint16(buffer, bufferOffset);
    // Deserialize message field [distance2]
    data.distance2 = _deserializer.uint16(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 6;
  }

  static datatype() {
    // Returns string type for a message object
    return 'assignment1_setup/Sonars';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '5579dba5245fa13e51014a8affff95eb';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    uint16 distance0
    uint16 distance1
    uint16 distance2
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new Sonars(null);
    if (msg.distance0 !== undefined) {
      resolved.distance0 = msg.distance0;
    }
    else {
      resolved.distance0 = 0
    }

    if (msg.distance1 !== undefined) {
      resolved.distance1 = msg.distance1;
    }
    else {
      resolved.distance1 = 0
    }

    if (msg.distance2 !== undefined) {
      resolved.distance2 = msg.distance2;
    }
    else {
      resolved.distance2 = 0
    }

    return resolved;
    }
};

module.exports = Sonars;
