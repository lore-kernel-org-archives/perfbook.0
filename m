Return-Path: <SRS0=Ra1/=IY=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=Gu9TQFCFPze5AzNzAKQ4uQAhFerFx9LDQP9m11fVbvs=;
        b=XWd4SqHR/qnLs9NeypNDzgGUbug5umE7vjrFgADpRS8qMOvQobk+YoVcxYAWnC907F
         A+TWILB6Q5r2eqd4ZvuFuhIW1GfQK36ilwOZJw956V2Bfis0awtS+wtW5qaKd0IXri69
         X5LotDQR40al32ZTmwmo9QmLL1E0zd4t0agKrK0u3QGjuZb3FMGR/NHXYrnCMnMGCJ1z
         g5dAE7GIz5t4PQz7Fdn53OXcJrQDvl5ibl2nfEauh8sACqf8Y97gD84ioZZjZmNDkR7M
         lPoMhkCsZjsue5Jdzadae0CYoR7pKBvQ0nR/Xl6PDM13VZKxnPsdHYsHZvus1V+vKgQ9
         RQfA==
Subject: Re: [PATCH -perfbook 0/5] ebook reader size support
References: <20210323010153.GH77072@balbir-desktop>
 <64419413-f54f-a737-bcae-e03b8ecaf606@gmail.com>
 <20210325161652.GL2696@paulmck-ThinkPad-P72>
 <eb5b9862-1fa3-93b4-1a2c-b287a16bdfbb@gmail.com>
 <20210326001216.GO2696@paulmck-ThinkPad-P72>
 <765e63d4-b555-3a03-5a08-b2d061f5fed7@gmail.com>
 <20210326005137.GP2696@paulmck-ThinkPad-P72>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <ee692df9-413f-e5b1-7012-0b32749e9b4f@gmail.com>
Date: Fri, 26 Mar 2021 10:08:21 +0900
MIME-Version: 1.0
In-Reply-To: <20210326005137.GP2696@paulmck-ThinkPad-P72>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: Balbir Singh <bsingharora@gmail.com>, perfbook@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>

On Thu, 25 Mar 2021 17:51:37 -0700, Paul E. McKenney wrote:
> On Fri, Mar 26, 2021 at 09:26:23AM +0900, Akira Yokosawa wrote:

[...]

>>
>> Hmm...
>>
>> In the attached akiyks.patch, there are [PATCH RFC 1/2] and [PATCH RFC 2/2].
>> and the [PATCH RFC 1/2] wouldn't apply due to missing Balbir's RFC PATCH.
>>
>> Or do you want me to check if there is any damage in some of the 7 patches
>> I sent out?
>>
>> I think starting from [PATCH -perfbook 1/5], the patch set should work.
>>
>> Or what am I missing???
> 
> You are quite right, my fault entirely.
> 
> Some days it just doesn't pay to take hold of the keyboard.  :-/

;-) ;-) ;-)

> 
> Anyway, back to the original question, it looks pretty good, though
> some of the larger tables (17.1, for example) are truncated.  Which
> I suspect you were saying earlier when talking about shrinking things.

Yes, that's the current situation.
I was hoping Balbir could do further adjustments of remaining large
floats based on the scheme in this patch set.

        Thanks, Akira

> 
> 							Thanx, Paul
> 
