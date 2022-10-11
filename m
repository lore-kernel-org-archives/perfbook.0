Return-Path: <SRS0=f179=2M=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3VYBLI3+UBcBf3TtD7Uuuuwgi/it5hKzrNFKYQZePfg=;
        b=m5rghK0QPqs1HO+/p9zp4UOk6m+VIsz+GqXqtZVMEwtfTzgebOZWY/1KH4lq+c3w8I
         BhDMUp5cVFuMfHcdkEzbg7RCUdAS+nSU7uwMUrZ81UWbMbht5bleN/pPOdQh2DemzWA6
         FibCaPipUloimWldEkqPIDwG1q3R+I4tACRs1YtA2t4lQlw7woaVMOXnNgJ6DlGR3jFb
         MKRLGoQsZWJbo4uorIQrxPofDl+ZWkV4JsuF9X3C8M/Ggt57WdWJOKaBb5QF8sRM09c4
         ayxdzOeAp+OUxBMYs5dffXdBlUJ1bloT8vA2/Us7D+kCUOPmvByXpULwA94adgw1GHi2
         mppA==
Message-ID: <77e58db7-f04a-4642-2884-f2c8ff07b7da@gmail.com>
Date: Tue, 11 Oct 2022 19:41:56 +0900
MIME-Version: 1.0
Subject: Re: [PATCH] memorder.tex: the exists clause in Listing 15.35 should
 never be satisfied.
References: <CANJ3EgF5G-rK+VVTigRkDp97=UtAh3TcVWr0tcpZv2NF_0n-Hw@mail.gmail.com>
 <4f53aff4-6bf5-f4e0-6511-00cc040496e5@gmail.com>
 <20221011085825.GE4221@paulmck-ThinkPad-P17-Gen-1>
 <fb96c7ce-2374-aa32-263e-e67fafc1ab9a@gmail.com>
 <20221011094822.GJ4221@paulmck-ThinkPad-P17-Gen-1>
Content-Language: en-US
From: Akira Yokosawa <akiyks@gmail.com>
In-Reply-To: <20221011094822.GJ4221@paulmck-ThinkPad-P17-Gen-1>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: Patrick Yingxi Pan <pyxchina92929@gmail.com>, perfbook@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>

On Tue, 11 Oct 2022 02:48:22 -0700, Paul E. McKenney wrote:
> On Tue, Oct 11, 2022 at 06:21:16PM +0900, Akira Yokosawa wrote:
>> On Tue, 11 Oct 2022 01:58:25 -0700, Paul E. McKenney wrote:
>>> On Tue, Oct 11, 2022 at 05:37:55PM +0900, Akira Yokosawa wrote:
>>>> [+CC: Paul]
>>>>
>>>> Hi,
>>>>
>>>> On Tue, 11 Oct 2022 11:17:25 +0800, Patrick Yingxi Pan wrote:
>>>>> Hello!
>>>>>
>>>>> According to the context and my understanding of locking primitives, I
>>>>> suppose the 'exists' clause in the litmus test shouldn't be satisfied.
>>>>
>>>> I agree with you in that section 15.4.2.2 is described as if the
>>>> result were "Never".
>>>>
>>>> However, if you run herd7 on the litmus test, you'll get:
>>>>
>>>> ------------------------------------------------
>>>> Test Lock-outside-across Allowed
>>>> States 4
>>>> 0:r1=0; 1:r1=0;
>>>> 0:r1=0; 1:r1=1;
>>>> 0:r1=1; 1:r1=0;
>>>> 0:r1=1; 1:r1=1;
>>>> Ok
>>>> Witnesses
>>>> Positive: 2 Negative: 12
>>>> Condition exists (0:r1=0 /\ 1:r1=0)
>>>> Observation Lock-outside-across Sometimes 2 12   <--
>>>> Time Lock-outside-across 0.02
>>>> Hash=06337358bba3d1ed44db8ea81cf1d236
>>>> ------------------------------------------------
>>>>
>>>> That said, I'm not in the position of deciding LKMM is right or not.
>>>
>>> Thank you for checking, Akira!
>>>
>>> This is the following litmus test?
>>>
>>> CodeSamples/formal/herd/C-Lock-outside-across.litmus
>>
>> Yes, it is.
> 
> Strange.  This is what I get from it on the -rcu dev branch as well
> as on v6.0 and v5.19:
> 
> $ herd7 -conf linux-kernel.cfg /home/git/perfbook/CodeSamples/formal/herd/C-Lock-outside-across.litmus
> Test Lock-outside-across Allowed
> States 3
> 0:r1=0; 1:r1=1;
> 0:r1=1; 1:r1=0;
> 0:r1=1; 1:r1=1;
> No
> Witnesses
> Positive: 0 Negative: 3
> Condition exists (0:r1=0 /\ 1:r1=0)
> Observation Lock-outside-across Never 0 3
> Time Lock-outside-across 0.01
> Hash=06337358bba3d1ed44db8ea81cf1d236
> 
> Am I running a bad version of herd7 or something?
Ah, you are right!
I got the Sometimes result from herd7 of herdtools7's current master.

I'll try bisecting herdtools7.

Sorry for the noise.

        Thanks, Akira

> 
> $ herd7 -version
> 7.56+02~dev, Rev: c375ecc537da22070913496ad2043ae501c7ab78
> 
> 							Thanx, Paul
