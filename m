Return-Path: <junchangwang@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to;
        bh=UyGOqbeqJdSpQrlJbFHBxbXTE75Jro9F6TyUSbP5YBA=;
        b=DhDB2T7H7L2GHTv9ZRUx7nT2UxAaFNkRuQwHb8/JSaKmF46E3+box/APhes2jQ3DzG
         izrYgZCwU6dT1WWWbQ4Pv12FN2mFoeTxXsg+5a7L2wnDSNFVpbrZfBGSi5VbZ0u6biJ7
         OgByzeg05kr7nZdY0xmMnCkZ4fCr2TyzTBIDG2H3Q9K/MsmvBqweu9z3c3gvHne68uqB
         pyNjA3pfhmSev423bbe8/2mpUoYyrvYFPovpMqSSkMMANsfZAJJwITvb+yrrD3vuf+Nr
         Sl7pf4C0HfCVqYhFRAmqXmfbApDvqb+Y7HcPAqyiCAJyQkRii0XcjKIcUsPc+dyDkzlu
         1Ydg==
MIME-Version: 1.0
From: Junchang Wang <junchangwang@gmail.com>
Date: Mon, 1 Oct 2018 11:16:08 +0800
Message-ID: <CABoNC81BJOPV3oBQ-Q9m9-5VZAdWq0L_r+4m6Wv7QWuXQo1LnA@mail.gmail.com>
Subject: Other architectures we can work on?
Content-Type: multipart/alternative; boundary="000000000000a2395b0577223ad8"
To: paulmck@linux.ibm.com, perfbook@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>

--000000000000a2395b0577223ad8
Content-Type: text/plain; charset="UTF-8"

Hi Paul and list,

I'm again reading the excellent 15th chapter (Advanced Synchronization),
which helps me eventually understand how a hardware/compiler can
optimize--and hence ``break''-- my parallelized code :-).

I really want to get my hands dirty and to test my code and samples in
perfbook on real servers. However, all servers in my lab are x86. I wonder
if there is any chance that we can have access to architectures other than
x86 to test code. For example, are there any cloud service that provides
access to POWER or ARM architecture?

Thanks,
--Junchang

--000000000000a2395b0577223ad8
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi Paul and list,<div><br></div><div>I&#39;m again reading=
 the excellent 15th chapter (Advanced Synchronization), which helps me even=
tually understand how a hardware/compiler can optimize--and hence ``break&#=
39;&#39;-- my parallelized code :-).</div><div><br></div><div>I really want=
 to get my hands dirty and to test my code and samples in perfbook=C2=A0on =
real servers. However, all servers in my lab are x86. I wonder if there is =
any chance that we can have access to architectures other than x86 to test =
code. For example, are there any cloud service that provides access to POWE=
R or ARM architecture?</div><div><br></div><div>Thanks,</div><div>--Junchan=
g=C2=A0</div></div>

--000000000000a2395b0577223ad8--

