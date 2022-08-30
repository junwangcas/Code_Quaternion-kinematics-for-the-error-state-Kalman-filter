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

void QuaternionTestChapters::PrintQuat(const Eigen::Quaterniond &q)
{
    std::cout << "x/y/z/w: " << q.coeffs().transpose() << "\n";
}

void QuaternionTestChapters::PrintSection(const std::string chapter, const std::string section)
{
    std::cout << chapter << " - "  << section << " Done\n" << "------------------------------------- \n";
}

Eigen::Quaterniond QuaternionTestChapters::GetQuat30()
{
    Eigen::Vector3d v1{1, 0, 0};
    Eigen::Vector3d v2{std::sqrt(3), 1, 0};
    Eigen::Quaterniond test1 = Eigen::Quaterniond::FromTwoVectors(v1, v2); // 30 degree
    return test1;
}

void QuaternionTestChapters::Chapter12()
{
    {
        Eigen::Quaterniond test1 = Eigen::Quaterniond::Identity();
        Eigen::Quaterniond test2 = Eigen::Quaterniond::Identity();
        // sum is not defined
//        auto test3 = test1 + test2;
        //    std::cout << test3.coeffs().transpose() << "\n";
        PrintQuat(test1);
        PrintSection(__FUNCTION__ , "1 Sum");
    }
    {
        Eigen::Vector3d v1{1, 0, 0};
        Eigen::Vector3d v2{std::sqrt(3), 1, 0};
        Eigen::Quaterniond test1 = Eigen::Quaterniond::FromTwoVectors(v1, v2); // 30 degree
        auto test2 = test1;
        std::cout << "test1 euler: " << test1.toRotationMatrix().eulerAngles(2, 1, 0).transpose() * 180 / M_PI << "\n";

        auto test_prod = test1 * test2;
        std::cout << "test_prod euler: " << test_prod.toRotationMatrix().eulerAngles(2, 1, 0).transpose() * 180 / M_PI << "\n";

        PrintSection(__FUNCTION__, "2 Product");
    }
    {
        Eigen::Vector3d v1{1, 0, 0};
        Eigen::Vector3d v2{std::sqrt(3), 1, 0};
        Eigen::Quaterniond p = Eigen::Quaterniond::FromTwoVectors(v1, v2); // 30 degree
        Eigen::Quaterniond q = p.conjugate();
        std::cout << "p ";
        PrintQuat(p);
        std::cout << "p.conj ";
        PrintQuat(q);
        auto temp = p * q;
        std::cout << "p * q: ";
        PrintQuat(temp);
        std::cout << "(p * q)^*: ";
        PrintQuat(temp.conjugate());
        std::cout << "p.conj * q.conj: ";
        PrintQuat(p.conjugate() * q.conjugate());
        PrintSection(__FUNCTION__, "4 Conj");
    }
    {
        auto p = GetQuat30();
        double theta = acos(p.w());
        PrintQuat(p);
        std::cout << "theta : " << theta * 180 / M_PI<< "\n";
        PrintSection(__FUNCTION__, "7 Unit Quaternion");
    }
}

