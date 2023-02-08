Return-Path: <SRS0=B+67=6E=gmail.com=leobras.c@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:date:cc:to:from
         :subject:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Kr5CDdkUY8twqbb0AR3mg0Pe6yGaA6IgCmG6s6WTE7M=;
        b=f0BjrlZG2bQ/u3EUqYeX4iBfUs524mrm8jlztJdZ2mFRzUlSQHa+hr33CI8YwgZXpg
         SRmrV8yOF1ROMMglk6joW+eSnsvhU+QnjyznnXWp2F5R3PiKtHaERV0G8ki9chbp2PtE
         caYxOsKdNzjxSrotQwKJU5H6mcXl31DJuY0ky4DuNXxOVGdbM6JKFUjuQ62gOAsRonfq
         WYrPoyf/0/+/CTrn8ok2Geb5+QdpJvyF0/tlAmkeeEmCnbRl5lkzY6+K9n9vOZXQWyWE
         Cet9s6mJy4CUxfADSFRNlDNkQCQEYTkBuG1e8Lb9U3WvBbX0pPZLM1RjUohuFynbOo1z
         fIbg==
Message-ID: <fba1fe891b65449475c1e4e9abee2d3337c1567c.camel@gmail.com>
Subject: Question about Table E.1
From: Leonardo =?ISO-8859-1?Q?Br=E1s?= <leobras.c@gmail.com>
Date: Wed, 08 Feb 2023 00:07:20 -0300
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>

Hello Paul,

I have been reading the book, until I stumbled on Quick Quiz 3.7,
Table E.1: Performance of Synchronization Mechanisms
on 16-CPU 2.8 GHz Intel X5550 (Nehalem) System

<Copying from source, since the PDF is a little tricky>

The first part looks like:

        Clock period            &           0.4 &           1.0 \\
        Same-CPU CAS            &          12.2 &          33.8 \\
        Same-CPU lock           &          25.6 &          71.2 \\
        Blind CAS               &          12.9 &          35.8 \\
        CAS                     &           7.0 &          19.4 \\
=20
In this case, what would be the last lines "Blind CAS" and "CAS" referring =
to ?=20

(For a second I thought it could be "In-Core Blind CAS" and "In-Core CAS" l=
ike
in Table 3.1, but that would not make sense: This "CAS" is faster than the
previous "Same-CPU CAS". )

Thanks for reading,
Leo



