Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20120113;        h=subject:to:references:cc:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding;
 bh=eUYKAI+2f6+7yVnN6miDrzE9zjYn2JUiMmib7MLwKhg=;
 b=LC9AD6QvsKFJhfw3dLJNF7P2qB5nv2cFM6obPrz3Dw8KN8d1ujwot4htQKfkHr2iCY
 +bfF1K//kRyOzJ4PAcT5eMJyXj+iglbpbpHQf9zaenQBZdF4nfxan3ieqT2LbkEhi2Xd
 WH6uMdFaZpZVlRDYJUbrlpXaalxfUXKCKQLoFcoyKDRSIA/obHDjwnFYM7SJt9SkIKg4
 2B+UOxeQDvIjkbC7HUH1FYiBIVTaZv5/F8pNRZIpd7rxzJNYf+V3Az10QjF0IMEtOhON
 Km1PqLSkHXdXKbzLY0H/VacGtUTw6/mizhpgNx9Gpkp6it7d9Rpr71p8KrvLE+0j/x3l
 WnqQ==
Subject: Re: Some more feedback on Chapter 9
References: <a6181fde-e96e-294c-d0df-e996c27b401f@gmail.com>
 <20160728174057.GS3873@linux.vnet.ibm.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <a31719d7-0a87-d01a-9bc2-6deab382e2a9@gmail.com>
Date: Fri, 29 Jul 2016 06:41:37 +0900
MIME-Version: 1.0
In-Reply-To: <20160728174057.GS3873@linux.vnet.ibm.com>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
To: paulmck@linux.vnet.ibm.com
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

On 2016/07/28 10:40:57 -0700, Paul E. McKenney wrote:
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
> 
>> * Position of Quick Quiz 9.44 looks a little premature. SRCU is  mentioned
>>   just after the Quick Quiz.
> 
> Good catch, moved.
> 
>> * The 2nd sentence of Section 9.5.4.4 ends as "... in the companion article."
>>   This seems like a vestige of its origin in LWN. Should be fixed to match
>>   the context.
> 
> Now it is "Section~\ref{sec:defer:RCU Usage}", good eyes!
> 
>> * In the introduction of Section 9.5.5, understanding of the whole Chapter 9
>>   is listed in the prerequisite for the "toy" implementation. I suppose
>>   recursion is not intended here.
> 
> You know, that is strangely appropriate, now that you mention it!  ;-)
> 
> But how about the following?
> 
> 	Nevertheless, you will need a thorough understanding of Chapters
> 	2, 3, 4, and 6, as well as the previous portions of Chapter 9 for
> 	even these toy RCU implementations to be easily understandable.

It's perfect!

> 
>> * Also in the introduction of Section 9.5.5, Section 9.5.5.2 is not mentioned.
> 
> Fixed!  Now "Section 9.5.5.2 through 9.5.5.9".
> 

Wouldn't "Sections 9.5.5.2 through 9.5.5.9" be better?

>> * (Typo) In the 2nd paragraph of Section 9.7, there is a redundant "can" in
>>   "... so that updates can can operate locally, ...".
>>   (Yes, I can submit the fix of this one as a patch. If you want me to do so,
>>   please let me know.)
> 
> I fixed it with your Reported-by.
> 
> And here is the Youtube video corresponding to that particular typo:
> 
> 	https://www.youtube.com/watch?v=4Diu2N8TGKA

:-)

> 
>> * (Apart from Chapter 9) In Section 14.2.10.1, there are four instances of
>>   $\dagger$ for introducing notes. I'm wondering if they can be converted
>>   to footnotes. I'm not sure where they should be placed in the text, though.
> 
> Odd.  Those were there in the initial git commit.
> 
> I am removing the $\dagger$ commands and thus letting them be normal
> paragraphs.
> 
>> I said earlier there were a few issues, but in the end there are a quite a few.
>>
>> I don't mind if some (or all) of them be taken care of later after the upcoming
>> release.
> 
> They were all reasonably easy, so might as well do them now.  Famous
> last words.  ;-)
> 
> I commited and pushed them all.

Quick work!

There is one thing I forgot to mention.

In Appendix C.7.3, ARM-v7's memory barrier instructions are explained.
My understanding is that ARM-v8's memory barrier instructions are in line
with the semantics of Linux kernel's memory barrier primitives.
Wouldn't it be worth to mention somewhere, e.g., in a footnote?

                                                     Thanks, Akira

> 
> 							Thanx, Paul
> 
> 

