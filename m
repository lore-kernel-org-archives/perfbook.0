Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20120113;        h=subject:to:references:cc:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding;
 bh=JP7eonGUap7NEzOFQYSZbgMb6vribpaewzs1YGJLWmI=;
 b=I232opTRKmWw2iJ13dHreixA0Hh4hIEtNgL/FakSt8xv2QNBkYoKLHh2VnvviVor1s
 33x/SRHJK/JlUCglNsr/VJF1i1M9KQXXjEpbyi1BekC9CF6/RI+k8MiPRqxRlRKLddPy
 zsEdoR/3bL9/YNlA1WprG7sAWwl3dVCRHKlCqhg98RcOd6kGB/kHCHZe0pK8z+0974ID
 thWIHdv/IEKsuOMbEAYeVoUNnBo6OMu8hezKcwaQq5HCrndHuc8L3qyiLty1hpiCdJYg
 Sccg7TEUssaR9muUwTpFT6WUbmbOJ1L6G0ST3jUozKpKYlpX+W/Iu4NUDlgTlr0TkhyC
 pUtQ==
Subject: Re: [GIT PULL] SMPdesign: Use subscript in lockdeqhash figures
References: <fb2c9c38-c715-e176-a576-5dd4391832d5@gmail.com>
 <20160807181839.GE3482@linux.vnet.ibm.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <8e4b5679-a2aa-fc23-c086-8b1deb8f8603@gmail.com>
Date: Mon, 8 Aug 2016 07:08:17 +0900
MIME-Version: 1.0
In-Reply-To: <20160807181839.GE3482@linux.vnet.ibm.com>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
To: paulmck@linux.vnet.ibm.com
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

On 2016/08/07 11:18:39 -0700, Paul E. McKenney wrote:
> On Sat, Aug 06, 2016 at 07:07:29PM +0900, Akira Yokosawa wrote:
>> Hi Paul,
>>
>> This is somewhat related to the "using hyphens for minus signs" issue.
>> In Figures 6.8 and 6.9, entry names such as "L-2" are used.
>> The "-" here means minus, but it is *not* obvious at first glance if
>> it means "L minus 2" or not.
>>
>> If we make "-2" a subscript, it would be much easier to see that
>> it means "L whose sequence number is 'minus 2'".
>> So, I tweaked the xfig sources of the figures to make those numbers
>> in entries look like subscripts. I also altered the numbers in entry names
>> mentioned in the corresponding text as subscripts (using math mode).
>>
>> I'm sending this as a pull request as the resulting patch became fairly
>> large due to eps files.
>>
>> I hope you like there tweaks.
>>
>> Additional patch is a fix of entry numbers of Figure 6.9, which is
>> actually 16 if my understanding of the figure is correct.
> 
> I pulled both, thank you.
> 
> Any thoughts on converting .fig files to .svg?  My approach has been to
> import .fig files into inkscape as I need to modify them.  The results
> are OK, but not perfect (for example, arrows in .fig become two objects
> in .svg, the line and the arrowhead).

So, I tried this.
But by importing into inkscape, all the texts get the same font size...
Unfortunately, font size specifier in .fig seems to be ignored.
Or I might be missing something.

BTW, now that we can use -jN option for building .pdf files, wouldn't it
be a good idea to get rid of .eps files in the repository whose sources
are .fig files by adding a ".fig -> .eps" rule in Makefile?
Then the patch would have been much smaller.

Let me know what you think.

                                          Thanks, Akira
> 
> 						Thanx, Paul
> 
>>                                              Thanks, Akira 
>>
>> ---------
>> The following changes since commit ec15e80376f04f5b2be8779aedfda3ba184a4e37:
>>
>>   Fix URL for MathieuDesnoyers2009LFCollabSummit (2016-08-05 13:12:07 -0700)
>>
>> are available in the git repository at:
>>
>>   https://github.com/akiyks/perfbook.git lockdeqhash-use-subscript
>>
>> for you to fetch changes up to 7893124def444db34fbb6bc2b4e9b2f20675c2eb:
>>
>>   SMPdesign: Fix number of elements regarding Figure 6.9 (2016-08-06 18:14:07 +0900)
>>
>> ----------------------------------------------------------------
>> Akira Yokosawa (2):
>>       SMPdesign: Use subscript in lockdeqhash figures
>>       SMPdesign: Fix number of elements regarding Figure 6.9
>>
>>  SMPdesign/lockdeqhash1R.eps   | 330 +++++++++++++++++++++++++++++++++++-------
>>  SMPdesign/lockdeqhash1R.fig   |  39 +++--
>>  SMPdesign/lockdeqhashlots.eps | 323 +++++++++++++++++++++++++++++++++++------
>>  SMPdesign/lockdeqhashlots.fig |  48 ++++--
>>  SMPdesign/partexercises.tex   |  14 +-
>>  5 files changed, 622 insertions(+), 132 deletions(-)
>>
> 
> 

