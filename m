Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20120113;        h=subject:to:references:cc:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding;
 bh=Ao1raCO34irCGpmMb+49ilTaJQ8m2lIIgEczzE2MTyA=;
 b=oH/+tdZmVaKuOAAV/vpc1JGGQ5XlxOHDbUT+N3bqEJZrTQWby8jxUbQcet3wz5HQeA
 CTQDvTpp4/Ax1YoU66+KckcAYLsDL26Renk3BtDLT//Yb0A4RkQwziEz9ldgsYxFOqMJ
 uwDBwqjAbi5B6asEx3Kxz1Y37UeC+mYdnabpWjUPAHV48rdGeKyrqyoiEK5mibegtZFI
 idId4zXfkAdBaIFo60VoLZ58LPW0kdIm9M+DEmHiczYQg90ng4Q57BdyrjSfoqcaH5kQ
 jDDvEuXuL3FnjLmkVBHGQZBuphsukzwXLdovqlD6yDmCSZHMWd5HfgH2OP/UVLy+wFJ/
 /v6Q==
Subject: Re: Some more feedback on Chapter 9
References: <a6181fde-e96e-294c-d0df-e996c27b401f@gmail.com>
 <20160728174057.GS3873@linux.vnet.ibm.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <78fd52ad-b974-2b13-d963-84adc86615c1@gmail.com>
Date: Fri, 29 Jul 2016 06:59:24 +0900
MIME-Version: 1.0
In-Reply-To: <20160728174057.GS3873@linux.vnet.ibm.com>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
To: paulmck@linux.vnet.ibm.com
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

On 2016/07/29 2:40, Paul E. McKenney wrote:
> On Thu, Jul 28, 2016 at 10:06:22PM +0900, Akira Yokosawa wrote:
>> Hi Paul,
>>
>> There are still several issues regarding Chapter 9 I want to feedback.
>> I'm afraid most of them are beyond my ability to submit as patches.
>>
>> * At the beginning of Section 9.5.2, there is a credit of the form
>>   "Authors: ...".
>>   But there is \OriginallyPublished{} command just above the credit.
>>   I'm wondering if the credit in the text is necessary.
>>   There is a similar credit at the beginning of Section 14.2, but there is
>>   no \OriginallyPublished{} command there. This section seems to have been
>>   written for perfbook. If this is the case, for a consistent look, it would
>>   be better if the credit is moved to Appendix F.1.
> 
> Good point!  I am guessing that these predated \OriginallyPublished{}, and
> that I didn't get around to fixing them properly.  I have now fixed them.

And I'm wondering why I didn't realize the origin of Section 14.2 is
Documentation/memory-barriers.txt...
But they look fairly different now, don't they?

                                                Thanks, Akira

