Return-Path: <SRS0=y3V1=XB=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=/H0jYzKMHaO9LiyCUNPt1azwWQRu93mWL1863/knVj0=;
        b=a0PU99rANJqEiWXx8jDFJ1i2qZBVc07kFr9xDTAaTOjnP1uB7i6zj8xNZj0GUJVNjm
         Ebi8vDqa8dELM3FQG7Kxx108nop6oJpt9Xcg4lQxIwz2a5UCwbFXoOo4Dwz0aeIJdtqm
         PaGG03IWLMHzPH5ntTOVhYUlgUrlsR/3FaW1gUlFPcS9Im8cQ9F3a9JCVnhYiSsAGdsa
         bDpUcnwGlVUs+GIgs7WVoR19CjShpgd79EZzEBiwxCmeFHo/JxC6emhxA86hxWsF+MpH
         JWOWu4JqTxMaBaZ5DzSxF4Xz6hBVyIjXAGczVkALAE4n67wfueOnzgsSbqfgBuEo6z+T
         r1Tw==
Message-ID: <69a6b7d8-2ef9-7fad-2d46-42eebe49f953@gmail.com>
Date: Sun, 26 Jun 2022 13:34:53 +0900
MIME-Version: 1.0
Subject: =?UTF-8?Q?Re=3a_=5bperfbook=5d_Analogy_of_Figure_7=2e11_Locking_?=
 =?UTF-8?B?4oCcU2F3IEtlcmbigJ0=?=
Content-Language: en-US
References: <202dbad7-37db-4d6a-f4d4-6d99180028fc@gmail.com>
 <20220624233316.GF1790663@paulmck-ThinkPad-P17-Gen-1>
 <cb266856-a20e-231c-00fb-8e4435306d55@gmail.com>
 <20220625003053.GG1790663@paulmck-ThinkPad-P17-Gen-1>
From: Akira Yokosawa <akiyks@gmail.com>
In-Reply-To: <20220625003053.GG1790663@paulmck-ThinkPad-P17-Gen-1>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

On Fri, 24 Jun 2022 17:30:53 -0700, Paul E. McKenney wrote:
> On Sat, Jun 25, 2022 at 08:57:35AM +0900, Akira Yokosawa wrote:
>> On Fri, 24 Jun 2022 16:33:16 -0700, Paul E. McKenney wrote:
>>> On Sat, Jun 25, 2022 at 08:12:09AM +0900, Akira Yokosawa wrote:
>>>> Hi Paul,
>>>>
>>>> I find the analogy of Figure 7.11 hard to grasp.
>>>>
>>>> Whether a lock is global or per-instance, the cost of locking
>>>> (saw kerf) is observed only when a CPU/thread does the locking
>>>> operation.
>>>>
>>>> In this figure, does each board represent data elements, not a
>>>> CPU/thread?  If this is the case, what does the waste of "saw kerf"
>>>> mean?
>>>>
>>>> What am I missing?
>>>>
>>>> (I hope I am clear enough on what I don't get...)
>>>
>>> It might well be that I am getting too excited about this one.  ;-)
>>>
>>> Maybe I need to drop it.  At the very least, I need to much more clearly
>>> explain it.
>>>
>>> But...
>>>
>>> Each board represents one lock.  The "saw kerf" is the time lost when
>>> releasing that lock and someone else immediately acquiring it.
>>>
>>> Does that help?
>>
>> Well then, why does the left side figure have ten boards?
> 
> Ten locks.  For example, the single board might correspond to a hash
> table guarded by a single global lock.  The ten boards might correspond
> to a hash table with ten buckets, with per-bucket locking.

Ah, I think I understand what you mean.

On the "Global" side, there is a per-resource locking mechanism
implemented under the protection of a global lock, whereas locks
on the "Per-Instance" side are implemented independently with
each other.

Different boards can be acquired in parallel on both sides of the
figure.

Am I on the same page with you now?

> 
> But it is sounding like this analogy might be more confusing than
> enlightening.

An analogy which needs a lot of explanation might not be a good
analogy...

        Thanks, Akira

> 
> 							Thanx, Paul
