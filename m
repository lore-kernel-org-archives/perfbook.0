Return-Path: <SRS0=1cyx=6A=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qGvkKxOC03vS+Vm7Xg9tdpfdOLgBGdEFG8Yss6jgMcw=;
        b=J/n3ziitmgLHKAzhjN1T7ypQQZ+TqUimsofsD/fxpbl+Ih2GcwH6EVdkqyEcbmKWQV
         5IecW7oQr/GFBJY5WN7FEe5pacy2FOC+2l1ltfDqWcRJ208Evi1wvd0X2AEX8t/ZB5X4
         AkK4fLvyaxNh3CB8J6LS+1UMj3fB6unLANWW0Ej/eOJhiv8+mANa2t5JmyiX+xJZ9Zk1
         k+qxOZii1sPUH+4HHyvBuOpSWyXoUqZEjY1ny873AsQ3SuuX3DA0jsq2w2ad+d54VPX5
         7QTExqM8F6CZAus1I8ZIKwJ4b1TTob520BIIjszv+23H/AvS6R1UqDC17aEuMcAbSLv5
         g1cA==
Message-ID: <ea98db11-6549-793b-5b23-37a9cf441fe1@gmail.com>
Date: Sat, 4 Feb 2023 15:35:11 +0900
MIME-Version: 1.0
Subject: Re: [PATCH -perfbook] autodate.sh: Add graceful fallback of
 commitid-only mode for shallow clone
Content-Language: en-US
References: <5011ac44-402f-5185-bb62-0d2ac908da5e@gmail.com>
 <20230203164716.GJ2948950@paulmck-ThinkPad-P17-Gen-1>
 <402f2ac0179552e214206fb6adb36240113ddc51.camel@gmail.com>
 <20230203181950.GL2948950@paulmck-ThinkPad-P17-Gen-1>
 <72fe4499f87fb861c5fca94b6a8670e4c1100d4c.camel@gmail.com>
 <20230203185539.GM2948950@paulmck-ThinkPad-P17-Gen-1>
 <f04b56846957201b4212b5cdc183eaff926b6f85.camel@gmail.com>
 <20230204043614.GU2948950@paulmck-ThinkPad-P17-Gen-1>
From: Akira Yokosawa <akiyks@gmail.com>
In-Reply-To: <20230204043614.GU2948950@paulmck-ThinkPad-P17-Gen-1>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
To: paulmck@kernel.org, =?UTF-8?Q?Leonardo_Br=c3=a1s?= <leobras.c@gmail.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

On Fri, 3 Feb 2023 20:36:14 -0800, Paul E. McKenney wrote:
> On Fri, Feb 03, 2023 at 11:55:20PM -0300, Leonardo Br=C3=A1s wrote:
=2E..
>>
>> I will send a patch fixing the uname soon :)
>=20
> Thank you for digging into this!
>=20
> And yes, portability is easier than it was 40 years ago, but still not
> easy.  :-/

Hi,

You might be interested in this email thread in 2012 at GNU bugreport:

    https://debbugs.gnu.org/cgi/bugreport.cgi?bug=3D13001

Looks like the behavior of "uname -p" CodeSamples had assumed is common
to Ubuntu and Fedora (as well as RHEL and SUSE).

So, this issue is exposed by Leo's choice of archlinux:latest as the
base image.

Leo, just out of curiosity, what made you pick Arch Linux?

        Thanks, Akira

