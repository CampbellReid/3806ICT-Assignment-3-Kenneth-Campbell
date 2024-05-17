// Generated by gencpp from file assignment3/CreatePlan.msg
// DO NOT EDIT!


#ifndef ASSIGNMENT3_MESSAGE_CREATEPLAN_H
#define ASSIGNMENT3_MESSAGE_CREATEPLAN_H

#include <ros/service_traits.h>


#include <assignment3/CreatePlanRequest.h>
#include <assignment3/CreatePlanResponse.h>


namespace assignment3
{

struct CreatePlan
{

typedef CreatePlanRequest Request;
typedef CreatePlanResponse Response;
Request request;
Response response;

typedef Request RequestType;
typedef Response ResponseType;

}; // struct CreatePlan
} // namespace assignment3


namespace ros
{
namespace service_traits
{


template<>
struct MD5Sum< ::assignment3::CreatePlan > {
  static const char* value()
  {
    return "f5bba44cc5e16145329a21e1c3c0c658";
  }

  static const char* value(const ::assignment3::CreatePlan&) { return value(); }
};

template<>
struct DataType< ::assignment3::CreatePlan > {
  static const char* value()
  {
    return "assignment3/CreatePlan";
  }

  static const char* value(const ::assignment3::CreatePlan&) { return value(); }
};


// service_traits::MD5Sum< ::assignment3::CreatePlanRequest> should match
// service_traits::MD5Sum< ::assignment3::CreatePlan >
template<>
struct MD5Sum< ::assignment3::CreatePlanRequest>
{
  static const char* value()
  {
    return MD5Sum< ::assignment3::CreatePlan >::value();
  }
  static const char* value(const ::assignment3::CreatePlanRequest&)
  {
    return value();
  }
};

// service_traits::DataType< ::assignment3::CreatePlanRequest> should match
// service_traits::DataType< ::assignment3::CreatePlan >
template<>
struct DataType< ::assignment3::CreatePlanRequest>
{
  static const char* value()
  {
    return DataType< ::assignment3::CreatePlan >::value();
  }
  static const char* value(const ::assignment3::CreatePlanRequest&)
  {
    return value();
  }
};

// service_traits::MD5Sum< ::assignment3::CreatePlanResponse> should match
// service_traits::MD5Sum< ::assignment3::CreatePlan >
template<>
struct MD5Sum< ::assignment3::CreatePlanResponse>
{
  static const char* value()
  {
    return MD5Sum< ::assignment3::CreatePlan >::value();
  }
  static const char* value(const ::assignment3::CreatePlanResponse&)
  {
    return value();
  }
};

// service_traits::DataType< ::assignment3::CreatePlanResponse> should match
// service_traits::DataType< ::assignment3::CreatePlan >
template<>
struct DataType< ::assignment3::CreatePlanResponse>
{
  static const char* value()
  {
    return DataType< ::assignment3::CreatePlan >::value();
  }
  static const char* value(const ::assignment3::CreatePlanResponse&)
  {
    return value();
  }
};

} // namespace service_traits
} // namespace ros

#endif // ASSIGNMENT3_MESSAGE_CREATEPLAN_H
