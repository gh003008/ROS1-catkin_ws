#include <ros/ros.h> //ros 기본 헤더파일
#include <geometry_msgs/Twist.h>
/* Your code here*/
//생성한 메세지 파일 import

#include "ros_tutorials/MsgTutorial.h" //MsgTutorial 메시지 파일 헤더(빌드 후 자동 생성됨)
#include <geometry_msgs/Vector3.h>

/* Your code here*/




class CircularMotionPublisher
{
public:

    CircularMotionPublisher():loop_rate(10) //loop_rate 10Hz로 설정
    {
        /*     Your code here       */
        /* Publisher, Subscriber 정의*/
        // 퍼블리셔 선언, ros_tutorials 패키지의 MsgTutorial 메시지 파일을 이용한
        // 퍼블리셔 ros_tutorial_pub를 작성한다. 토픽명은"ros_tutorial_msg" 이며,
        // 퍼블리셔 큐(queue) 사이즈를 100개로 설정한다는것이다
        pub= nh.advertise<geometry_msgs::Twist>("turtle1/cmd_vel", 100);

        // 루프 주기를 설정한다. "10" 이라는 것은 10Hz를 말하는것으로 0.1초 간격으로 반복된다
        ros::Rate loop_rate(10);

        // MsgTutorial 메시지 파일 형식으로 msg라는 메시지를 선언
        ros_tutorials::MsgTutorial msg; // msg 라는 이름의 C++의 구조체를 이용

        // 메시지에 사용될 변수 선언
        // int count = 0;

        // 서브스크라이버 선언, ros_tutorials 패키지의 MsgTutorial 메시지파일을 이용한
        // 서브스크라이버 ros_tutorial_sub를 작성한다. 토픽명은 "ros_tutorial_msg" 이며,
        // 서브스크라이버 큐(queue) 사이즈를 100개로 설정한다는 것이다
        //sub= nh.subscribe("circular_motion", 100, msgCallback,this);
        sub = nh.subscribe("circular_motion", 100, &CircularMotionPublisher::msgCallback, this);






        /*     Your code here       */
    }

    /*     Your code here       */
    /*Subscriber의 callback 함수 설정 */
    // 메시지 콜백함수로써, 밑에서 설정한ros_tutorial_msg라는 이름의 토픽
    // 메시지를 수신하였을 때 동작하는 함수이다
    // 입력 메시지로는 ros_tutorials 패키지의 MsgTutorial 메시지를 받도록 되어 있다
    void msgCallback(const ros_tutorials::MsgTutorial::ConstPtr& msg)
    {
        auto rad = msg->radius;
        auto vel = msg->velocity;
        bool dir = msg->direction;

        auto linear = geometry_msgs::Vector3();
        if(dir)
        {
            linear.x = vel;
        }
        else
        {
            linear.x = -(vel);
        }
        linear.y = 0.0;
        linear.z = 0.0;

        auto angular = geometry_msgs::Vector3();
        angular.x = 0.0;
        angular.y = 0.0;
        angular.z = linear.x / rad;

        velocity.linear = linear;
        velocity.angular = angular;

        //ROS_INFO("Published linear vel: '%f'm/s", lin_vec.x msg->stamp.sec); // stamp.sec 메시지를 표시한다
        //ROS_INFO("recievemsg= %d", msg->stamp.nsec); // stamp.nsec 메시지를 표시한다
        //ROS_INFO("recievemsg= %d", msg->data); // data 메시지를 표시한다
    }

    /*     Your code here       */





    // loop_rate에 맞게 저장된 Twist 메시지를 Publish하도록 spin 설정
    void spin()
    {
        while(ros::ok())
        {
            pub.publish(velocity);// 메시지를 퍼블리시 하는 부분!
            ros::spinOnce();
            loop_rate.sleep();//loop_rate 만큼 슬립에 들어감 (기다림)
        }
    }

private:
    //nodehandle과 Publisher, Subscriber, 속도 정보를 저장할 Twist 메시지 객체 생성
    ros::NodeHandle nh;//ROS 시스템과 통신을 위한 노드 핸들 선언
    ros::Publisher pub;
    ros::Subscriber sub;
    ros::Rate loop_rate;
    geometry_msgs::Twist velocity;
};


int main(int argc, char **argv) //노드 메인 함수
{
    //ROS 시작 후 객체 생성 및 spin
    ros::init(argc, argv, "cm_publisher");// 노드명 초기화
    CircularMotionPublisher cm_publisher;
    cm_publisher.spin();
    return 0;
}
