Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20120113;        h=subject:to:references:cc:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding;
 bh=5I7wQ5XdPAoID2ids9Hkg1R6U+sx5FUMLMfPccgHFDg=;
 b=x0dTwLL+mU8sUNvg8NqGGyLE0CXDwGFBm4i6amgjWtNuQtYpJVyDkClm2j7K7/YAbW
 z56q1qxkBQeGK2Jd1NMes5VsxeTpJ29Awdp006L19KfpXtJBw3cTrRL83xJKzmEzKEJy
 UtpX7UWBJbKpz1J4JlSbOt7e/1lESv/IDA9yh7rNdYWn0nkLqG3JSLQpqRZv/9jEDKOP
 Ft9G/3ZWy/yFzNetjB7Z0W3C+k6TGRS6EmlF1p4YJVA/MWtQztjkx/Xl1Fv0MPKmAs17
 WjMhXxU9ztsERf2xQX1eVFiorjNoRA1VlwBttB0FfWnBMt5+1PhdfMZHra0vuSeRP8VW
 kxSw==
Subject: Re: [GIT PULL] SMPdesign: Use subscript in lockdeqhash figures
References: <fb2c9c38-c715-e176-a576-5dd4391832d5@gmail.com>
 <20160807181839.GE3482@linux.vnet.ibm.com>
 <8e4b5679-a2aa-fc23-c086-8b1deb8f8603@gmail.com>
 <20160808001528.GG3482@linux.vnet.ibm.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <60290e7c-1444-9064-d481-640ae3e5daa0@gmail.com>
Date: Tue, 9 Aug 2016 00:21:04 +0900
MIME-Version: 1.0
In-Reply-To: <20160808001528.GG3482@linux.vnet.ibm.com>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
To: paulmck@linux.vnet.ibm.com
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

On 2016/08/07 17:15:28 -0700, Paul E. McKenney wrote:
> On Mon, Aug 08, 2016 at 07:08:17AM +0900, Akira Yokosawa wrote:
>> On 2016/08/07 11:18:39 -0700, Paul E. McKenney wrote:
>>> On Sat, Aug 06, 2016 at 07:07:29PM +0900, Akira Yokosawa wrote:
>>>> Hi Paul,
>>>>
>>>> This is somewhat related to the "using hyphens for minus signs" issue.
>>>> In Figures 6.8 and 6.9, entry names such as "L-2" are used.
>>>> The "-" here means minus, but it is *not* obvious at first glance if
>>>> it means "L minus 2" or not.
>>>>
>>>> If we make "-2" a subscript, it would be much easier to see that
>>>> it means "L whose sequence number is 'minus 2'".
>>>> So, I tweaked the xfig sources of the figures to make those numbers
>>>> in entries look like subscripts. I also altered the numbers in entry names
>>>> mentioned in the corresponding text as subscripts (using math mode).
>>>>
>>>> I'm sending this as a pull request as the resulting patch became fairly
>>>> large due to eps files.
>>>>
>>>> I hope you like there tweaks.
>>>>
>>>> Additional patch is a fix of entry numbers of Figure 6.9, which is
>>>> actually 16 if my understanding of the figure is correct.
>>>
>>> I pulled both, thank you.
>>>
>>> Any thoughts on converting .fig files to .svg?  My approach has been to
>>> import .fig files into inkscape as I need to modify them.  The results
>>> are OK, but not perfect (for example, arrows in .fig become two objects
>>> in .svg, the line and the arrowhead).
>>
>> So, I tried this.
>> But by importing into inkscape, all the texts get the same font size...
>> Unfortunately, font size specifier in .fig seems to be ignored.
>> Or I might be missing something.
> 
> Hmmm...  I guess I have been getting lucky, working only with .fig files
> with a single font size.
> 
>> BTW, now that we can use -jN option for building .pdf files, wouldn't it
>> be a good idea to get rid of .eps files in the repository whose sources
>> are .fig files by adding a ".fig -> .eps" rule in Makefile?
>> Then the patch would have been much smaller.
>>
>> Let me know what you think.
> 
> Making that initial clone and build go faster makes a lot of sense to me!

Well, current build starts from .eps and if we remove .eps, then the build
will start from .fig. So the build time should increase somewhat.
Reduction of the patch size will be the point of doing this.

I'll try and evaluate how much longer the first build would take.
Give me a week or so. Ah, my environment has only a few cores so the
evaluation result would be only a hint.

                                                Thanks, Akira

> 
> 							Thanx, Paul
> 
>>                                           Thanks, Akira
>>>
>>> 						Thanx, Paul
>>>
>>>>                                              Thanks, Akira 
>>>>
>>>> ---------
>>>> The following changes since commit ec15e80376f04f5b2be8779aedfda3ba184a4e37:
>>>>
>>>>   Fix URL for MathieuDesnoyers2009LFCollabSummit (2016-08-05 13:12:07 -0700)
>>>>
>>>> are available in the git repository at:
>>>>
>>>>   https://github.com/akiyks/perfbook.git lockdeqhash-use-subscript
>>>>
>>>> for you to fetch changes up to 7893124def444db34fbb6bc2b4e9b2f20675c2eb:
>>>>
>>>>   SMPdesign: Fix number of elements regarding Figure 6.9 (2016-08-06 18:14:07 +0900)
>>>>
>>>> ----------------------------------------------------------------
>>>> Akira Yokosawa (2):
>>>>       SMPdesign: Use subscript in lockdeqhash figures
>>>>       SMPdesign: Fix number of elements regarding Figure 6.9
>>>>
>>>>  SMPdesign/lockdeqhash1R.eps   | 330 +++++++++++++++++++++++++++++++++++-------
>>>>  SMPdesign/lockdeqhash1R.fig   |  39 +++--
>>>>  SMPdesign/lockdeqhashlots.eps | 323 +++++++++++++++++++++++++++++++++++------
>>>>  SMPdesign/lockdeqhashlots.fig |  48 ++++--
>>>>  SMPdesign/partexercises.tex   |  14 +-
>>>>  5 files changed, 622 insertions(+), 132 deletions(-)
>>>>
>>>
>>>
>>
> 
> 

