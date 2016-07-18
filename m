Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20120113;        h=subject:to:references:cc:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding;
 bh=dUjRGp7fDuq5/epymzcux7UXuYX+7jmExMMFLTGLrqE=;
 b=yktKDYmRaN71rDlqwHB7OnP2VqgGJfnTopN0F9XoFS7onFiSIu0w+jQbb2AGvx2fZE
 ekYXH/6fUhZhMbH/1Czue8V0JE5GyxVHniNAJ0q3NyOT34gGNm7StiKUKZU8PR/44GmX
 1/1yLY8Cm/v4lZ/hk8kiSo/DMyR1jVk2MaSREM5M4ekxpH0ZKYddlbj0OfwBwKeZ1L33
 geACpSIenEs0yg6QbaxwIn80+JAqype1Par1BWbIrlZog2tDSyv0RsdzRGe++QLzl7KM
 5AJxHr0gSIAAICZguqnByz/Aux/7hLaHyF+5JrIUuCbtj9gfSEQpuemnDZ/lEhCpb7/r
 Ma6A==
Subject: Re: [PATCH] qqz: Add another hyperlink to black box in QQA
References: <0bf67306-7169-4ce5-ca66-b68c2833ee99@gmail.com>
 <20160717215900.GD7094@linux.vnet.ibm.com>
 <731d8ed0-deae-e159-a889-ba38822011e8@gmail.com>
 <20160717233606.GE7094@linux.vnet.ibm.com>
 <113d52db-a2b8-8900-8163-576e8129877f@gmail.com>
 <20160718065414.GF7094@linux.vnet.ibm.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <0b5f4397-3ea8-2089-42ef-fc537864328a@gmail.com>
Date: Mon, 18 Jul 2016 19:28:19 +0900
MIME-Version: 1.0
In-Reply-To: <20160718065414.GF7094@linux.vnet.ibm.com>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
To: paulmck@linux.vnet.ibm.com
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

On 2016/07/17 23:54:14 -0700, Paul E. McKenney wrote:
> On Mon, Jul 18, 2016 at 08:58:59AM +0900, Akira Yokosawa wrote:
>> On 2016/07/18 8:36, Paul E. McKenney wrote:
>>> On Mon, Jul 18, 2016 at 07:54:27AM +0900, Akira Yokosawa wrote:
>>>> On 2016/07/17 14:59:00 -0700, Paul E. McKenney wrote:
>>>>> On Sun, Jul 17, 2016 at 02:50:04PM +0900, Akira Yokosawa wrote:
>>>>> >From 2a74b30f0a1d036e45c6aa5ef431034c23f790db Mon Sep 17 00:00:00 2001
>>>>>> From: Akira Yokosawa <akiyks@gmail.com>
>>>>>> Date: Tue, 12 Jul 2016 20:28:08 +0900
>>>>>> Subject: [PATCH] qqz: Add another hyperlink to black box in QQA
>>>>>>
>>>>>> This commit adds another cross-link to the black boxes in QQA.
>>>>>> I think this change would meet readers' expectation.
>>>>>>
>>>>>> Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
>>>>>
>>>>> I agree!  For reasons that are not clear to me, I had to hand-apply
>>>>> this patch.  Might have been a white-space issue, which I did not
>>>>> think to check for...
>>>>>
>>>>> Please take a look at the patch below to make sure that I did it
>>>>> correctly.
>>>>
>>>> Yes, you did it right. I'm wondering what was wrong on my side.
>>>
>>> My guess is whitespace.  Or maybe the email got mangled along the way.
>>>
>>>>> Also, this suggests a possibility:  In the quick-quiz answer, suppose
>>>>> that the heading and the black box link (as they do now) to the beginning
>>>>> of the quick-quiz question, but that the white box links to the end
>>>>> (or just after the end) of the quick-quiz question.  That way, the
>>>>> reader could choose the return point.
>>>>>
>>>>> Would that make sense?
>>>>
>>>> Well, yes if readers expect the behavior.
>>>> But for long answers, there are cases where you can choose only the white
>>>> boxes in your view. I'm hesitating because of your reaction to the first
>>>> attempt  the other day.
>>>
>>> All good points!
>>>
>>>> Anyway, I'm going to submit a patch for you to try.
>>>>
>>>> Also we'd also need to update the explanation in the answer of Quick Quiz 1.3
>>>> if we actually do the change.
>>>
>>> Looking forward to it!
>>
>> So, I'm submitting 2 versions of patch in reply to this mail.
>> 1st one makes "the white box link to the end the quick-quiz question."
>> 2nd one makes "the white box link to just after the end of the quick-quiz
>> question."
>>
>> Both of them are relative to current master.
>> Please compare them and let me know which one you like.
>> Or just apply the one you choose.
>>
>> Then I'll compose the additional explanation according to your choice.
>
> Before I do that -- which of the two do you prefer?

The 1st one.
Its behavior is identical to my first attempt.
Clicking a white box will bring you to the black box of corresponding question,
so you can see you are at the end of the question.

2nd one's white box will bring you to the beginning of the next paragraph of the
question, so you might feel you've lost sense of where you are.
As I'm trying it myself, especially in 2-column layout, 2nd one seems too
aggressive.  I should have tested more before submitting.

So, please try the 1st one. And as I said before, it may take a while for you to
get used to it.

And it's okay with me if you decide to keep the behavior as it is.

                                                   Thanks, Akira

>
> 							Thanx, Paul
>
>

