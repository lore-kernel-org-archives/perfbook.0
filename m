Return-Path: <SRS0=sCky=6E=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Hl/ooH4TEWu3V/DP7hoCuoPXJQfaj1ohJidE5RxqIfw=;
        b=LicLYnQYK1PnPbEtMjnjYn7S9IW/0Z6vWcSTRWVfSfk/nOKeCB+jNGSi+h3ED34qyh
         shQMlpivlv8tzMUpV6mLQ6Px+Fkm0YIkeg115C4cXXoPQw+bQk57Jd7XvJ2XU4DQv1hk
         VPoxMvTyDyfotNFQNryKrJ5WPu3WmJvlWrum0/gJ35NSiIj+LpZhYKFPS2YNq6/7AtFb
         UvNaY1vDwqj6KfgaqsLr+9qNZtxLgyR1PFpQCjYShtRQhWwwPNqg2VzeiR/ioeNn7ltG
         igzza0WrX9+R+TUOx8iJ0OpZuEe5Tx2gf3zIU4A1nfO/d2fKH3NAvnqwNIT1PJv/pqdx
         b51A==
Message-ID: <7c88779c-208f-ff17-7f23-f7042ea122e5@gmail.com>
Date: Wed, 8 Feb 2023 19:26:58 +0900
MIME-Version: 1.0
Subject: Re: Question about Table E.1
References: <fba1fe891b65449475c1e4e9abee2d3337c1567c.camel@gmail.com>
 <20230208034102.GG2948950@paulmck-ThinkPad-P17-Gen-1>
 <52d25e8e-9a57-3744-fc0d-17f4a5f36d9f@gmail.com>
Content-Language: en-US
From: Akira Yokosawa <akiyks@gmail.com>
In-Reply-To: <52d25e8e-9a57-3744-fc0d-17f4a5f36d9f@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
To: paulmck@kernel.org, =?UTF-8?Q?Leonardo_Br=c3=a1s?= <leobras.c@gmail.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

On Wed, 8 Feb 2023 17:47:31 +0900, Akira Yokosawa wrote:
> Hi,
>=20
> On Tue, 7 Feb 2023 19:41:02 -0800, Paul E. McKenney wrote:
>> On Wed, Feb 08, 2023 at 12:07:20AM -0300, Leonardo Br=C3=A1s wrote:
>>> Hello Paul,
>>>
>>> I have been reading the book, until I stumbled on Quick Quiz 3.7,
>>> Table E.1: Performance of Synchronization Mechanisms
>>> on 16-CPU 2.8 GHz Intel X5550 (Nehalem) System
>>>
>>> <Copying from source, since the PDF is a little tricky>
>>>
>>> The first part looks like:
>>>
>>>         Clock period            &           0.4 &           1.0 \\
>>>         Same-CPU CAS            &          12.2 &          33.8 \\
>>>         Same-CPU lock           &          25.6 &          71.2 \\
>>>         Blind CAS               &          12.9 &          35.8 \\
>>>         CAS                     &           7.0 &          19.4 \\
>>> =20
>>> In this case, what would be the last lines "Blind CAS" and "CAS" refe=
rring to ?=20
>>>
>>> (For a second I thought it could be "In-Core Blind CAS" and "In-Core =
CAS" like
>>> in Table 3.1, but that would not make sense: This "CAS" is faster tha=
n the
>>> previous "Same-CPU CAS". )
>>
>> I was surprised myself, but those measurements are quite real.  My bes=
t
>> guess is that the two threads in the core are able to overlap their
>> accesses, while the single CPU must do everything sequentially.
>=20
> Paul, do you remember how you obtained the data set?
> There are several data sets under CodeSamples/cpu/data/, but I don't
> see the one corresponds to the table.
>=20
> The code for collecting these data was added in CodeSamples/cpu/
> by commit 81989d7483e2 ("cpu: Reproduce the old cache-to-cache
> latency measurement code") in 2020. And the next commit 2fc05ca07edc
> ("api-pthreads.h: Use clock_gettime() and check sched_setaffinity()")
> improved the stability of reproduced code.
>=20
> This table was first added in commit 38fd945ff401 ("Fill out CPU
> chapter, including adding Nehalem data.") in 2009.
> The data have never been updated since.
>=20
> I'm kind of suspecting the "7.0 us" which surprised you at the time
I mean,                      "7.0 ns"

        Thanks, Akira

> might have been an outlier due to some disturbance discussed in
> Appendix A.3 "What Time Is It?".
>=20
> I'm not sure, just guessing...
>=20
>         Thanks, Akira
>=20
>>
>> Strange, but whatever the reason, true!  ;-)
>>
>> 							Thanx, Paul
