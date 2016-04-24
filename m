Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20120113;        h=subject:to:references:cc:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding;
 bh=pg6w/qtMH3sBkFHrMSHxopzZd3yzmipK0NAGbdpddoU=;
 b=t08NgcOQxkW6ze3U5ZbQZ7mZjDbLo5fhtHoXDirdE1/MToNx8XecqUhdS+dlaOZeQV
 3d+rST4sGi/hCqs6KDKe61IuPgxJDNCeV3xOjpvJ2kckf1E6I1zXhzsxNNyOs8YmHgDK
 eyRL4h6kghBpwvSFX9bJs4+peJFygPaeilQu5OjYADnSZCFM+Q8LZcxsJSzwExhqi50F
 ushWdxa0Og9Z6VyiMDbaJBBhvvqUTPaXEhppcCQlBDpKUGpI43NszLc+bAn0I1QX7+Tq
 M9rWQwLRSmNNATAwqgx9awnttfddR1m0Q1dA5V43Ke7KlDVsLOI6PivoJGPa1/Fo57Vz
 s+pw==
Subject: Re: [PATCH v3 1/3] qqz: Improve accuracy of cross-links
References: <571C1843.1060906@gmail.com> <571C1C8F.9000602@gmail.com>
 <571C42A1.8060201@gmail.com> <571C6CBB.4080101@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <571CD6E7.4060301@gmail.com>
Date: Sun, 24 Apr 2016 23:23:35 +0900
MIME-Version: 1.0
In-Reply-To: <571C6CBB.4080101@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
To: paulmck@linux.vnet.ibm.com
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

On 2016/04/24 15:50, Akira Yokosawa wrote:
> On 2016/04/24 12:50, Akira Yokosawa wrote:
>> On 2016/04/24 10:08, Akira Yokosawa wrote:
>>> >From 6ecb00b37832372d18cdc7ff5eaea9a53eab3cb9 Mon Sep 17 00:00:00 2001
>>> From: Akira Yokosawa <akiysw@gmail.com>
>>> Date: Sun, 24 Apr 2016 08:19:20 +0900
>>> Subject: [PATCH v3 1/3] qqz: Improve accuracy of cross-links
>>>
>>> In commit 33b93f8258f5 ("qqz: Cross-link questions and answers"),
>>> cross-links of quick quizzes and their answers were implemented.
>>> However it uses the \stepcounter{} command, and direct references
>>> of 'quickquizctr' counter is not output to the .aux file.
>>> The symptom is when you click on a hyperlink in the resulting PDF,
>>> you jump to a random nearby label such as that of Figure, Table,
>>> or Section, etc. which happens just before the \label{} using
>>> 'quickquizctr'.
>>>
>>> By using \refstepcounter{} instead and using 2 counters
>>> 'quickquizctr' and 'quickquizctrC' ('C' stands for 'Chapter'),
>>> each of which is automatically reset at a new chapter and
>>> a new section respectively, and defining \theHNum at the head
>>> of qqz.sty, then redefining it within the \QuickQuizAnsers
>>> command, matching QQ.n.m's and QQA.n.m's are output to the .aux
>>> file correctly.
>>>
>>> By applying this change, resulting hyperlinks become to jump to
>>> places almost exactly where you'd expect.
>>>
>>> This change may have the effect of increasing the required number
>>> of 'pdflatex' iterations to get a final result. The following
>>> commit will take care of it.
>>>
>>> This commit also updates the copyright notices in the header,
>>> including the name of Paolo Bonzini who authored the commit
>>> mentioned above.
>>>
>>> Signed-off-by: Akira Yokosawa <akiysw@gmail.com>
>>
>> Hi, Paul.
>>
>> I noticed there really is a change in the behavior of hyperref's of
>> Chapters. They used to jump to the top of the pages, but after
>> this patch is applied, they jump to the bottom of the Chapter titles.
>> So you need to scroll a little to see the title of the Chapters.
>>
>> I think this is a regression caused by this patch.
>>
>> If you do think so, please keep from pushing this series out.
>>
>> Or the benefit of the patch is big enough compared to the change
>> of the behavior?
>>
>>                                             Regards, Akira
>>
> 
> Hi,
> 
> Seems like it is not easy (at least for me) to find out what
> is wrong in this patch. 
> 
> So there are a few options I can think of you might want to do 
> (assuming you'd like to push the refactoring of runlatex.sh):
> 
> 1) Apply the series as a whole, then revert [1/3], and push out.
> 
> 2) Me resubmit another patch series which just contains the refactoring.
> 
> 3) Apply the series as a whole, and push it as is in the hope
> of someone familiar with LaTeX and hyperref might appear.
> 
> Thoughts?
> 
>                                               Regards, Akira
> 

Hi, Paul.

So, you've pushed the whole series.
And I have to apologize to you for the noise.
I've just realized that I compared apples and oranges.

In perfbook.pdf, hyperref of a Chapter jumps to the bottom of its
title, while in perfbook-1c.pdf, it jumps to the head of the page.

There was no change in the behavior.

I'm very glad I can contribute the perfbook project in this manner.

So far, patches I submitted were mostly cosmetic changes.
I'm planning to submit something that touches the actual contents, too.
But don't expect too much.

                                             Thanks so much, Akira

