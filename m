Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20120113;        h=subject:to:references:cc:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding;
 bh=BL8wFOckkuQlXkpCUZeGT3KFWoNxjGVuLpQgCyr+GKk=;
 b=LLBRSpyvj9ImmZiIsMq/hsc3SN7l7fNMp9JThPrG+ccqpu+hI2KWGs3u9y/lD/pOBL
 OLtqeGekol7ejSgd69calTGFE0QPMF3y/AP+0eJQYenVBRP4B55NJrrp2UymRzXz00BI
 oNLDSMbvVKVLI6phol2J8/swUHmyLU1twNhk618Lwq20evrbSHUNwLmYcD4Exn/9+Kox
 UBd3+UtF9Q1RPPKB97zPvusCqFz5dI7k00hIT9E4nAgqyC5OTpfZjyVFFiRFFtgmRIsV
 QvwS2DsbedPtmbq+ssqFPM9QZlNllpZdHfFw58ZyCAxkMSnLbsH//CRS0ENh2PUdMZ2w
 4xHQ==
Subject: Re: [PATCH] qqz: Add another hyperlink to black box in QQA
References: <0bf67306-7169-4ce5-ca66-b68c2833ee99@gmail.com>
 <20160717215900.GD7094@linux.vnet.ibm.com>
 <731d8ed0-deae-e159-a889-ba38822011e8@gmail.com>
 <20160717233606.GE7094@linux.vnet.ibm.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <113d52db-a2b8-8900-8163-576e8129877f@gmail.com>
Date: Mon, 18 Jul 2016 08:58:59 +0900
MIME-Version: 1.0
In-Reply-To: <20160717233606.GE7094@linux.vnet.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
To: paulmck@linux.vnet.ibm.com
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

On 2016/07/18 8:36, Paul E. McKenney wrote:
> On Mon, Jul 18, 2016 at 07:54:27AM +0900, Akira Yokosawa wrote:
>> On 2016/07/17 14:59:00 -0700, Paul E. McKenney wrote:
>>> On Sun, Jul 17, 2016 at 02:50:04PM +0900, Akira Yokosawa wrote:
>>> >From 2a74b30f0a1d036e45c6aa5ef431034c23f790db Mon Sep 17 00:00:00 2001
>>>> From: Akira Yokosawa <akiyks@gmail.com>
>>>> Date: Tue, 12 Jul 2016 20:28:08 +0900
>>>> Subject: [PATCH] qqz: Add another hyperlink to black box in QQA
>>>>
>>>> This commit adds another cross-link to the black boxes in QQA.
>>>> I think this change would meet readers' expectation.
>>>>
>>>> Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
>>>
>>> I agree!  For reasons that are not clear to me, I had to hand-apply
>>> this patch.  Might have been a white-space issue, which I did not
>>> think to check for...
>>>
>>> Please take a look at the patch below to make sure that I did it
>>> correctly.
>>
>> Yes, you did it right. I'm wondering what was wrong on my side.
>
> My guess is whitespace.  Or maybe the email got mangled along the way.
>
>>> Also, this suggests a possibility:  In the quick-quiz answer, suppose
>>> that the heading and the black box link (as they do now) to the beginning
>>> of the quick-quiz question, but that the white box links to the end
>>> (or just after the end) of the quick-quiz question.  That way, the
>>> reader could choose the return point.
>>>
>>> Would that make sense?
>>
>> Well, yes if readers expect the behavior.
>> But for long answers, there are cases where you can choose only the white
>> boxes in your view. I'm hesitating because of your reaction to the first
>> attempt  the other day.
>
> All good points!
>
>> Anyway, I'm going to submit a patch for you to try.
>>
>> Also we'd also need to update the explanation in the answer of Quick Quiz 1.3
>> if we actually do the change.
>
> Looking forward to it!

So, I'm submitting 2 versions of patch in reply to this mail.
1st one makes "the white box link to the end the quick-quiz question."
2nd one makes "the white box link to just after the end of the quick-quiz
question."

Both of them are relative to current master.
Please compare them and let me know which one you like.
Or just apply the one you choose.

Then I'll compose the additional explanation according to your choice.

                                           Thanks, Akira

> 						Thanx, Paul
>

