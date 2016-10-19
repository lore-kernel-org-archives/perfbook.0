Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20120113;        h=subject:to:references:cc:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding;
 bh=gspn/pIs/h3cGvwJQBcrgqQTrWcYS9OYmPdmzJl8RD4=;
 b=tJqcB+6qp9GU5TJHkR1r5YV1aqNij1FIQWayvoluB4dATbZENQtO8YewP61C3mMIYH
 O40KB/mi9nnZw0z555bTxWPL/LUdTjcKuDG2WwVmwJxJEGkgZFNYBVOAiowN2ikhKLDi
 f5XiTDaphGzFzy7K2VcDxdHgaeDyW47O36PPFjsAkB3G6X4dvoQFJ+jqGATpnywTkDxV
 AOsNPEJdEpK0xf52udAsn7Gfj9lM4gueCKfM6OH+6M2/ya0vjOMGeY1uJkQnUCWt3wF1
 iUtlTCpgXnKbVNObF68achnka8ETeZ8Gq3LG8pYyzVbvR+Cq4XIVC39ePhU0khU0MVqi
 Jz+w==
Subject: Re: [PATCH 0/6] Add targets for alternative fonts
References: <9229c60d-0468-7632-e59e-3921f0e46f54@gmail.com>
 <20161019064548.GC3716@linux.vnet.ibm.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <69cf5602-9cb2-04f1-ffe3-b580b4cb8d25@gmail.com>
Date: Wed, 19 Oct 2016 23:45:03 +0900
MIME-Version: 1.0
In-Reply-To: <20161019064548.GC3716@linux.vnet.ibm.com>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
To: paulmck@linux.vnet.ibm.com
Cc: perfbook@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>

On 2016/10/18 23:45:48 -0700, Paul E. McKenney wrote:
> On Wed, Oct 19, 2016 at 06:57:56AM +0900, Akira Yokosawa wrote:
>> >From ec360d66cdab86bbe98d544aca52aaec1e03518e Mon Sep 17 00:00:00 2001
>> From: Akira Yokosawa <akiyks@gmail.com>
>> Date: Sun, 16 Oct 2016 20:11:35 +0900
>> Subject: [PATCH 0/6] Add targets for alternative fonts
>>
>> Hi,
>>
>> As I implied in the cover-letter of previous patch set, I attempted to
>> add make targets for alternative monospaced fonts.
>>
>> Courier font is said to be a standard monospeced typewriter font.
>> It is good as long as you don't mix it with other fonts, but when mixed
>> used in Times Roman text, it looks too wide and too thin.
>>
>> Typewriter fonts available in LaTeX are listed at the LaTeX Font
>> Catalogue site: http://www.tug.dk/FontCatalogue/typewriterfonts.html
>> (including both monospaced and proportional fonts).
>>
>> I have no idea how much people prefer courier font, so I took two
>> approaches.
>>
>> One was to try courier font variations.
>> The other was to try "txtt" based font packages. "txtt" is a font
>> designed to look better when mixed used with Times fonts.
>>
>> But I couldn't figure out which to propose because of pros and cons
>> of candidate fonts. So I just added make targets for people to try.
>>
>> Detailed explanation of these new targets and font packages can be
>> found in the commit message of the 3rd patch ("Makefile: Add targets
>> for alternative monospace fonts").
>>
>> Summary of pros and cons of each target is as follows.
>>
>>   mss: (courier scaled)
>>     pros: o can build on old TeX installation
>>     cons: o too thin
>>           o scaling by .94 affects apparent vertical position (looks
>>             slightly lower than Times Roman text)
>>   msr: (nimbusmono regular)
>>     pros: o thick enough
>>     cons: o requires recent TeX installation
>>           o scaling by .94 affects apparent vertical position (looks
>>             slightly lower than Times Roman text)
>>   msn: (nimbusmononarrow)
>>     pros: o can hold up to 64 characters in a line of code snippet
>>     cons: o requires recent TeX installation
>>           o single letter variable names denoted by \co{} may be hard
>> 	    to recognize
>>   mstx: (txtt)
>>     pros: o can build on old TeX installation
>>           o looks mostly good when mixed with Times Roman
>>     cons: o zero character is slashed
>>           o asterisk character has a higher position
>>   msnt: (newtxtt)
>>     pros: o looks mostly good when mixed with Times Roman
>>     cons: o requires recent TeX installation
>>           o asterisk character has a higher position
>>
>> Shrinking courier based fonts reduces the x-height, and causes
>> monospaced text to look somewhat lower than Times Roman text.
>> Actual baseline is not affected but the look is affected.
>>
>> My preference is the target "msnt" which uses "newtxtt" font package.
>> But "txtt" based fonts have higher positions of "*" character.
>> I anticipate some people to have hesitation to use it.
>>
>> There are other obstacles here.  Some of the targets require quite
>> recent LaTeX installation or manual installation of font packages.
>>
>> On Ubuntu Trusty, only the targets "mss" and "mstx" can be built on
>> TeX Live 2013 available there.
>>
>> On Ubuntu Xenial, TeX Live 2015 works just fine for all the targets.
>>
>> My recommendation is to use "mss" (courier scaled) option as the default
>> and permit up to 57 characters in a line of code snippets, and give people
>> alternative font choices as make targets.
>>
>> If "mss" is acceptable as the default, we can modify "perfbook.tex" and
>> revert ad hoc fontsize tweaks done in the past.
>>
>> The latter half of this patch set is an attempt to use sans serif font
>> (Helvetica) as default font for one-column layout. Sans serif fonts are
>> said to be easier to read on a lower resolution display. 
>>
>> Again, there is an obstacle here. I used a package "mathastext" for math
>> mode font tweaks, but the version of mathastext on Ubuntu Trusty conflicts
>> with hyperref package. The version provided on Ubuntu Xenial works fine
>> with a workaround given in the 5th patch ("Redefine \path command for
>> sans serif font").
>>
>> Please take time to see which one meets your preference and let me
>> know what you feel.
>>
>>                                                 Thanks, Akira
>>
>> Akira Yokosawa (6):
>>   Separate font package declarations
>>   Adjust scale of sans serif font
>>   Makefile: Add targets for alternative monospace fonts
>>   Makefile: Add target '1csf' (one-column sans serif)
>>   Redefine \path command for sans serif font
>>   Makefile: Add notice of mathastext version for 1csf
>>
>>  Makefile     | 25 ++++++++++++++++++++++++-
>>  perfbook.tex | 38 ++++++++++++++++++++++++++------------
>>  2 files changed, 50 insertions(+), 13 deletions(-)
> 
> Applied and pushed, thank you!
> 
> Getting on a plane soon, but will check tables containing code later, as
> these have been the places where font size has been the most troublesome.
> 
> Next time, could you please resend the whole series as v2?  Just makes it
> a bit easier to process.  ;-)

Yes. I noticed the error just before leaving home. I half expected to get
request for v2. Doing manual patch submission in the morning was a bad idea...

                                                   Regards, Akira

> 
> 							Thanx, Paul
> 
> 

