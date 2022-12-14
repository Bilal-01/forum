<?php

// autoload_static.php @generated by Composer

namespace Composer\Autoload;

class ComposerStaticInitf1b085a81f4ace83a6e4c5df2f5b7af5
{
    public static $prefixLengthsPsr4 = array (
        'P' => 
        array (
            'PHPMailer\\PHPMailer\\' => 20,
        ),
    );

    public static $prefixDirsPsr4 = array (
        'PHPMailer\\PHPMailer\\' => 
        array (
            0 => __DIR__ . '/..' . '/phpmailer/phpmailer/src',
        ),
    );

    public static $classMap = array (
        'Composer\\InstalledVersions' => __DIR__ . '/..' . '/composer/InstalledVersions.php',
    );

    public static function getInitializer(ClassLoader $loader)
    {
        return \Closure::bind(function () use ($loader) {
            $loader->prefixLengthsPsr4 = ComposerStaticInitf1b085a81f4ace83a6e4c5df2f5b7af5::$prefixLengthsPsr4;
            $loader->prefixDirsPsr4 = ComposerStaticInitf1b085a81f4ace83a6e4c5df2f5b7af5::$prefixDirsPsr4;
            $loader->classMap = ComposerStaticInitf1b085a81f4ace83a6e4c5df2f5b7af5::$classMap;

        }, null, ClassLoader::class);
    }
}
