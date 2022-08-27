//
// Created by junwangcas on 2022/8/27.
//

#include "quaternion_test_chapters.h"

QuaternionTestChapters::QuaternionTestChapters()
{

}

QuaternionTestChapters::~QuaternionTestChapters()
{

}

void QuaternionTestChapters::Chapter12()
{
    {
        Eigen::Quaterniond test1 = Eigen::Quaterniond::Identity();
        Eigen::Quaterniond test2 = Eigen::Quaterniond::Identity();
        // sum is not defined
//        auto test3 = test1 + test2;
        //    std::cout << test3.coeffs().transpose() << "\n";
        std::cout << __FUNCTION__ << " Sum Done \n";
    }
    {
        Eigen::Vector3d v1{1, 0, 0};
        Eigen::Vector3d v2{std::sqrt(3), 1, 0};
        Eigen::Quaterniond test1 = Eigen::Quaterniond::FromTwoVectors(v1, v2); // 30 degree
        auto test2 = test1;
        std::cout << "test1 euler: " << test1.toRotationMatrix().eulerAngles(2, 1, 0).transpose() * 180 / M_PI << "\n";

        auto test_prod = test1 * test2;
        std::cout << "test_prod euler: " << test_prod.toRotationMatrix().eulerAngles(2, 1, 0).transpose() * 180 / M_PI << "\n";

        std::cout << __FUNCTION__ << " Product Done \n";

    }

    {
    }

}

