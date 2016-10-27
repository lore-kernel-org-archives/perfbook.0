Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20120113;        h=subject:references:cc:from:to:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding;
 bh=ADfz/OapFGruwpAZCXL8oS5AJN05AqDcnVFC9UdxG2Q=;
 b=JnQ7Ky2cRDaOwHAGWM7x0liFKg+T4pjiuWXPBBBYjGHyoPMY0cZUybyTBCfm1rPfEI
 K+fHViUAmm1DzwtNCAX6H0LTm3P6hXZNxUntKoX8T0hEpT1psTLxRgSApWWDypX3fAXV
 sdpDsmSjzNPbBa537ipRdvDQIJ2gdq9buFvKvh/jAMkFCZVc4E0glVz8x5XDXWmHuNY5
 JsM3tmdnkQD/nKdCf+ACZnqsPpUEnXj98wnN6cXVLwdCXfl150qgied9zYiakWWl/W0B
 FW+MPvOWF/Sf5KjLuIquqYqI7X26do1gCEcdSHEx6ZI8MiCFSZC82nGyyadHMgi2Cigs
 34qg==
Subject: Re: [Q] url in bibliography
References: <8d8bb422-0d2c-f905-4f72-bafe6d702af5@gmail.com>
 <20161027160101.GL3716@linux.vnet.ibm.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <0850c6ee-628c-557d-122e-8569619e0566@gmail.com>
Date: Fri, 28 Oct 2016 07:45:16 +0900
MIME-Version: 1.0
In-Reply-To: <20161027160101.GL3716@linux.vnet.ibm.com>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

On 2016/10/27 09:01:01 -0700, Paul E. McKenney wrote:
> On Fri, Oct 28, 2016 at 12:19:36AM +0900, Akira Yokosawa wrote:
>> Hi Paul,
>>
>> I have a question regarding your commit 29650119a215 ("Update bibliography").
>>
>> In the 1st hunk,
>>
>>> +@unpublished{PaulEMcKennneyToolKitP0232R0
>>> +,Author="Paul E. McKenney and Michael Wong and Maged Michael"
>>> +,Title="P0232R0: A Concurrency ToolKit for Structured Deferral or Optimistic
>>> +Speculation"
>>> +,month="February"
>>> +,day="12"
>>> +,year="2016"
>>> +,note="\url{http://www.open-std.org/jtc1/sc22/wg21/docs/papers/2016/p0232r0.pdf}"
>>> +}
>>
>> you chose the format 'note="\url{http://...}"'.
>>
>> In the 2nd hunk,
>>
>>> +@unpublished{HansBoehm2012seqlockC11
>>> +,author="Hans-J. Boehm"
>>> +,title="Can Seqlocks Get Along With Programming Language Memory Models?"
>>> +,Year="2012"
>>> +,Month="June"
>>> +,Day="6"
>>> +,Note="HPL-2012-68"
>>> +,url={http://www.hpl.hp.com/techreports/2012/HPL-2012-68.pdf}
>>> +}
>>> +
>>
>> you chose the format 'url={http://...}'.
>>
>> There are other format such as 'note="Available \url{http://...}
>> [Viewed Month Day, Year]"' in the other part of bibliography.
>>
>> I'm wondering what is the rule which format to choose in expressing urls.
>> Could you enlighten me?
> 
> It has varied over time.  :-/
> 
> I have been using LaTeX and accumulating .bib entries since before "url="
> and "\url" existed, in fact since before the web existed.  The "Available"
> syntax was required for my Ph.D. dissertation, but I have been backing
> away from it because it is ugly and takes up a lot of space.
> 
> So, what would you suggest?  ;-)
> 
> One constraint...  The "unpublished" entries must have a "note" field,
> so the ",note=\url{" form seems necessary in those cases, at least
> when there is no technical report number or some such.  In most other
> types of bib entries, it is quite possible that "url=" look better.
> 
> One thing to keep in mind, also.  The .bib files in perfbook are copies
> of a master .bib git tree that I keep privately, in part because I
> never dreamed back in 1987 that I would ever be making the comments in
> the .bib files public, and I never have gotten time to clean them up.
> Plus some of the not-for-public-consumption comments are quite useful,
> so I don't want to delete them.  And yes, the oldest bib entries really
> were collected the old-fashioned way, by going to a physical library,
> holding a physical book/magazine/journal/whatever, writing the information
> down on paper, then going back to my desk and typing it all into my
> terminal.  Which in some cases would have been a 24x80 dumb terminal
> (like a VT100), but in other cases might have been an X terminal,
> a Sun workstation, or, later, a PC running X.
> 
> So my normal process requires me to apply the patches twice, often by
> hand to the private git tree.  Which is fine normally, but might need
> some help for a mass-change patch set.  For example, perhaps a script.
> 
> Suggestions?
>

So, these bib files are an library collected for nearly three decades!!!
They are invaluable as they are, and I'd appreciate your decision to
make them public.

There are two issues in urls in the bib files.
One is the inconsistency of format discussed here.
The other is the dead links. There are quite a few urls that end up in
"not found" now. Maintaining urls would require a great deal of work itself...

To make the format consistent, a script would work. But before beginning
implementation, we need to clarify what the script would do.
So I'll make some sample replacement patches to confirm your preference.

                                             Thanks, Akira

> 							Thanx, Paul
> 
> 

