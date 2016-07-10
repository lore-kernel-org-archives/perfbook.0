Return-Path: <paulmckrcu+caf_=paulmck=linux.vnet.ibm.com@gmail.com>
Received: from mail-pf0-f170.google.com ([209.85.192.170]:32876 "EHLO
 mail-pf0-f170.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org	with
 ESMTP id S1752636AbcGJXB1 (ORCPT	<rfc822;perfbook@vger.kernel.org>); Sun, 10
 Jul 2016 19:01:27 -0400
Received: by mail-pf0-f170.google.com with SMTP id i123so29228894pfg.0 for
 <perfbook@vger.kernel.org>; Sun, 10 Jul 2016 16:01:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20120113;        h=subject:to:references:cc:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding;
 bh=9vFWUseKRPH+zELnce1/o+C8aKg8FMlStKAPqxw0IcI=;
 b=JIQCexPh4luZ3ZONJ4kXOqm1tWuw5vgGHXskmsT8EWYh2O2BREx4UX1Ql1SBOKmVV9
 uCwtl/JKRnD/VpYh4gVWiiOIvK/RWZlQA92lx/CDdbRLa5lEmhX05bs1ypOKC6PRxJ/w
 RCd9c54JB8P/qGxX8r8pryf5SIdG2hPOdUuopq+O/aAW7bGaQGkfS5CgjC/twsWml2m+
 EG0Qy+hjT2G3EebsIarIAYlieT0YFU+7itWvyzCJZ+iTNlf+4H/OtNkxcfzEaAdVkIeV
 9aJ0qgpmi11v5cDj6UO35iKb7P8Omcu66aPa3PPPpVLbMXeeWnmpQVdUFfj30EDVVxiI
 n9pA==
Subject: Re: [GIT PULL] Cosmetic fixes round 3 and other fixes
References: <8ed6c47e-5844-4ee0-d42e-0c038f27daec@gmail.com>
 <20160710144141.GW4650@linux.vnet.ibm.com>
 <7bc131c6-d5af-f8b7-dbf3-53de265ea5a7@gmail.com>
 <20160710153502.GY4650@linux.vnet.ibm.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <bd5ad965-7472-494c-ff18-0bb6a1ed00af@gmail.com>
Date: Mon, 11 Jul 2016 08:01:23 +0900
MIME-Version: 1.0
In-Reply-To: <20160710153502.GY4650@linux.vnet.ibm.com>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: paulmck@linux.vnet.ibm.com
Cc: perfbook@vger.kernel.org, =?UTF-8?B?5Lya56S+44G044GL?= <akira.yokosawa@toshiba.co.jp>

On 2016/07/10 08:35:02 -0700, Paul E. McKenney wrote:
> On Mon, Jul 11, 2016 at 12:08:11AM +0900, Akira Yokosawa wrote:
>> On 2016/07/10 23:41, Paul E. McKenney wrote:
>>> On Sat, Jul 09, 2016 at 03:24:51PM +0900, Akira Yokosawa wrote:
>>>> Hi Paul,
>>>>
>>>> Today, because of the weather, I have time to do clean up the cosmetic
>>>> fixes. Appended are two pull requests.
>>>
>>> Very good!  I pulled both and pushed them out.  I made a small change
>>> to the label for the table that you (rightly) changed to a figure,
>>> so that it is prefixed by "tab:" rather than "fig:".
>>>
>>
>> Oh, I missed those labels...
>>
>> So, I reviewed latex source of recently added figures.
>> You are still using 'center' environment within 'figure' environment.
>> That will cause extra small vertical spacing between the body of the
>> figure and its caption.
>>
>> In stead of doing such as:
>>
>> \begin{figure}[tb]
>> \begin{center}
>> \resizebox{{2.5in}{!}{\includegraphics{path-to-figure}}
>> \end{center}
>> \caption{foo bar}
>> \label{fig:foo bar}
>> \end{figure}
>>
>> please do this way:
>>
>> \begin{figure}[tb]
>> \centering
>> \resizebox{{2.5in}{!}{\includegraphics{path-to-figure}}
>> \caption{foo bar}
>> \label{fig:foo bar}
>> \end{figure}
>
> I fixed the one that I added to defer/refcnt.tex, good catch.
>
>> Also, there are templates in ".Templates/figure-graphics" that
>> use the 'center' environment. They should also be fixed to use
>> \centering instead.
>
> Actually, unless you have objections, I intend to remove them.  My
> practice for a long time has been to copy existing figures.  In fact,
> I had forgotten that the .Template directory even existed.  ;-)

I found the template by using emacs' 'grep-find' function.
So feel free to remove them.

There remains one use of 'center' environment in
/advsync/memorybarriers.tex.
I left it as is since it is not nested in another environment.

But it might be a good idea to promote it to a full-fledged figure with
a caption. It's up to your preference.

And there is another suggestion I'd like to make.

Wouldn't it be a good idea to advertize the cross-link feature of qqz
somewhere, for example in the Answer of Quick Quick 1.3?

                                                     Thanks, Akira

> And that is how the new figure was done the old way -- I copied the
> definition before I applied your changes.
>
>> For reference, please see (for example):
>>
>> http://tex.stackexchange.com/questions/2651/should-i-use-center-or-centering-for-figures-and-tables
>>
>> for people's opinions. (The long URL might be wrapped arround)
>
> Fair enough!
>
> 							Thanx, Paul
>
[...]
