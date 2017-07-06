Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;        h=mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=ksDcDSRXA/a6uDwVCl/CRMphfsB6r4vj0tE0JKvNhys=;
 b=CzU7L05Qv4TZlyLKzF+SQr+FU5KedKFKqfwAXHpJ7s0nMYWo/Wy1dJwso7dw4PbLv6
 qQCRXhYaHBiIffa0vP/dx6e4mY7WuzFmhN/7WbI/ywIdagsXs8ehMRq+RtoQ1KEqomSg
 7DsEJBaf9aKnVGW6Bn3uJwYZ0wWHgg3ZkOHW1oJ6ZUfEQ0oGH0rQk8E1UA9gAk3Tidtk
 lFpOo4YRry7PlWpinTDrU0IAB0OUmuA88fzYmwnIqQk9WR9NFG0orzunRO+BVhfHVFya
 6JssoFysBo2SXo9VVXeigzgo5Y+bklXZXV20iQgbVTNTklk7vgA3HZqh8pMiSCMzmzab
 fvSQ==
Content-Type: text/plain;	charset=utf-8
Mime-Version: 1.0 (1.0)
Subject: Re: [PATCH] advsync: Fix store-buffering sequence table
From: Akira Yokosawa <akiyks@gmail.com>
In-Reply-To: <20170706004609.GP2393@linux.vnet.ibm.com>
Date: Thu, 6 Jul 2017 10:07:50 +0900
Content-Transfer-Encoding: quoted-printable
Message-Id: <62C40525-EA17-4BA6-AEF7-5BD3621241C9@gmail.com>
References: <1e3fe2af-cce3-7327-488d-fb27ec7d9fc8@gmail.com>
 <20170704222138.GR2393@linux.vnet.ibm.com>
 <73696d24-1e3d-68cf-5bc2-f15390883bdc@gmail.com>
 <20170705154024.GU2393@linux.vnet.ibm.com>
 <20170705155004.GB29379@linux.vnet.ibm.com>
 <20170705173249.GA22308@linux.vnet.ibm.com>
 <81458845-cd7c-1cf0-cb45-d346846d14d7@gmail.com>
 <20170705223218.GH2393@linux.vnet.ibm.com>
 <030d74ba-e816-cde6-5c31-a0cf25a3b320@gmail.com>
 <20170706004609.GP2393@linux.vnet.ibm.com>
To: paulmck@linux.vnet.ibm.com
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

2017/07/06 9:46=E3=80=81Paul E. McKenney <paulmck@linux.vnet.ibm.com> =E3=81=
=AE=E3=83=A1=E3=83=83=E3=82=BB=E3=83=BC=E3=82=B8:

>> On Thu, Jul 06, 2017 at 07:40:45AM +0900, Akira Yokosawa wrote:
>>> On 2017/07/06 7:32, Paul E. McKenney wrote:
>>>> On Thu, Jul 06, 2017 at 07:15:24AM +0900, Akira Yokosawa wrote:
>>>> On 2017/07/05 10:32:49 -0700, Paul E. McKenney wrote:
>>>=20
>>> [ . . . ]
>>>=20
>>>>>>> So I cannot go with "volatile", but let's see if I can do something
>>>>>>> better than the gcc intrinsics.
>>>>>>=20
>>>>>> And if the litmus7 guys don't have anything for me, I can always writ=
e a
>>>>>> script to do the conversions.  So either way, we will have kernel-sty=
le
>>>>>> notation at some point.  ;-)
>>>>>=20
>>>>> And it turns out that the contents of a second "{}" in a litmus7 test
>>>>> is pulled directly into the output code, so an easy change.  ;-)
>>>>=20
>>>> Good news!
>>>>=20
>>>> So __atomic_thread_fence() will also be replaced with smp_mb() in
>>>> the litmus tests? That will reduce the width of the tables and eliminat=
e
>>>> the need for the hspece adjustments in one-column layout.
>>>=20
>>> Oops, I forgot to push!  Done now.
>>>=20
>>> And yes, there is now smp_mb() in the litmus tests and the tables.
>>=20
>> I'll take a look later.
>> As I mentioned earlier, __atomic_load_n() and __atomic_store_n() seem
>> to have fairly large overheads (on x86). You might want to see the change=
s
>> in the resulting statistics and reflect them in the text.
>=20
> I am getting a fair amount of variance on the results, and thus a
> fair amount of overlap in the number of times each scenario shows up.
> Perhaps I should say that and also state that different hardware will
> likely get different results?
>=20
So the reason I saw the large overhead might be the disturbance of virtual g=
uest machine. I didn't try repeatedly after the change.

If you don't see any significant difference in the result, there is no need t=
o modify the text.

But mentioning the possibility of fluctuations will be of help.

Sorry for the noise.

Thanks, Akira=E2=80=82
(from mobile, might be QP encoded)
>                            Thanx, Paul
>=20

