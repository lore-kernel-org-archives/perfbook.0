Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20120113;        h=subject:to:references:cc:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding;
 bh=7TmpcOSdWvJVabOQ9sJMAosi7pjl/PuE+FNm5e3DRvE=;
 b=QL+RGO6mNfRTAQqMGWGftaqVXTB1zLus+nbRKupb8zmAe2ETgOgHWEF3aOhA46+pxc
 bT+y4ocstgeAa8Hsij9bAb/CGA4ouVvaE+VpQoEmOhfjPZPRdL7ZO3J9ecXk3mxpo1+9
 urPx59qZ2GiAnW0VNpptJyxiXvDfFnOF4T06pT/tkq6wm65tNZ6DBNe/p9npzARHf5tz
 dq/my1ezrhlqBYFTK+4uGHu2IfRxzqx4BXFPRth+uE3nnwge2IUgPXX/aXnRrBt2fKx3
 i5HYRjm0CGERiqlukUjcQ9g9YY74nKVXRLfkggcklKg4jl5Y2pVCi+xlTVc/bl2Gx894
 m1hQ==
Subject: Re: [PATCH v3 1/3] qqz: Improve accuracy of cross-links
References: <571C1843.1060906@gmail.com> <571C1C8F.9000602@gmail.com>
 <571C42A1.8060201@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <571C6CBB.4080101@gmail.com>
Date: Sun, 24 Apr 2016 15:50:35 +0900
MIME-Version: 1.0
In-Reply-To: <571C42A1.8060201@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
To: paulmck@linux.vnet.ibm.com
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

On 2016/04/24 12:50, Akira Yokosawa wrote:
> On 2016/04/24 10:08, Akira Yokosawa wrote:
>> >From 6ecb00b37832372d18cdc7ff5eaea9a53eab3cb9 Mon Sep 17 00:00:00 2001
>> From: Akira Yokosawa <akiysw@gmail.com>
>> Date: Sun, 24 Apr 2016 08:19:20 +0900
>> Subject: [PATCH v3 1/3] qqz: Improve accuracy of cross-links
>>
>> In commit 33b93f8258f5 ("qqz: Cross-link questions and answers"),
>> cross-links of quick quizzes and their answers were implemented.
>> However it uses the \stepcounter{} command, and direct references
>> of 'quickquizctr' counter is not output to the .aux file.
>> The symptom is when you click on a hyperlink in the resulting PDF,
>> you jump to a random nearby label such as that of Figure, Table,
>> or Section, etc. which happens just before the \label{} using
>> 'quickquizctr'.
>>
>> By using \refstepcounter{} instead and using 2 counters
>> 'quickquizctr' and 'quickquizctrC' ('C' stands for 'Chapter'),
>> each of which is automatically reset at a new chapter and
>> a new section respectively, and defining \theHNum at the head
>> of qqz.sty, then redefining it within the \QuickQuizAnsers
>> command, matching QQ.n.m's and QQA.n.m's are output to the .aux
>> file correctly.
>>
>> By applying this change, resulting hyperlinks become to jump to
>> places almost exactly where you'd expect.
>>
>> This change may have the effect of increasing the required number
>> of 'pdflatex' iterations to get a final result. The following
>> commit will take care of it.
>>
>> This commit also updates the copyright notices in the header,
>> including the name of Paolo Bonzini who authored the commit
>> mentioned above.
>>
>> Signed-off-by: Akira Yokosawa <akiysw@gmail.com>
> 
> Hi, Paul.
> 
> I noticed there really is a change in the behavior of hyperref's of
> Chapters. They used to jump to the top of the pages, but after
> this patch is applied, they jump to the bottom of the Chapter titles.
> So you need to scroll a little to see the title of the Chapters.
> 
> I think this is a regression caused by this patch.
> 
> If you do think so, please keep from pushing this series out.
> 
> Or the benefit of the patch is big enough compared to the change
> of the behavior?
> 
>                                             Regards, Akira
> 

Hi,

Seems like it is not easy (at least for me) to find out what
is wrong in this patch. 

So there are a few options I can think of you might want to do 
(assuming you'd like to push the refactoring of runlatex.sh):

1) Apply the series as a whole, then revert [1/3], and push out.

2) Me resubmit another patch series which just contains the refactoring.

3) Apply the series as a whole, and push it as is in the hope
of someone familiar with LaTeX and hyperref might appear.

Thoughts?

                                              Regards, Akira

