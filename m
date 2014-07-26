Return-Path: <isaac.to@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20120113;
 h=mime-version:in-reply-to:references:date:message-id:subject:from:to
 :cc:content-type;        bh=httlkoNBLqxBgKRcKfsyeeWsYNgjVciTCz5fH7zueus=;
 b=PQpqCINXixYvvkJyPfWpwleFRh8rkK3GGDG5RlJ1PPWnChC50AiIDGbTbnrA7DcQQU
 m9RoO0El2dUH/ZfQC6e4DdetviJ0Cra7IhDn+5YXIecuhOi4KZZ/cmsbD0S9SAyQ76Uj
 vzn4DNG3gAc6xosSfhd7rnFb0LB1Ufct5EWLGvUn1caKJaaFjMK+9ehUMn1cFZbatYkr
 V0dbrOuE4Cai5TvVbjysfsbAXeuWYZHCn2S3j2arBr2kTNUeQWM2GL/eNa9mRlzqYneB
 AIUqU+WmcqGa/fWlU9MdOwDDHh75GpWEoD4NL1225zkGwJPDIf4wsjtYoe8U2ujZQu2J
 KBlw==
MIME-Version: 1.0
In-Reply-To: <20140722155730.GA11241@linux.vnet.ibm.com>
References: 
 <CAOArY3XAD986MWLXcnG3VsYk40jyRgK8N+aWHniOnNJUTbmy9w@mail.gmail.com>
 <20140722155730.GA11241@linux.vnet.ibm.com>
Date: Sat, 26 Jul 2014 16:47:51 +0800
Message-ID: 
 <CAOArY3UOo6mk=y5yQi+mqvRfrduJodYOE0tL3ioyAx4qx-Lfww@mail.gmail.com>
Subject: Re: Error report: perfbook Section 11.6.3.2
From: Isaac To <isaac.to@gmail.com>
Content-Type: text/plain; charset=UTF-8
To: paulmck@linux.vnet.ibm.com
Cc: perfbook@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>

On Tue, Jul 22, 2014 at 11:57 PM, Paul E. McKenney
<paulmck@linux.vnet.ibm.com> wrote:
>> The probability being calculated needs to be specified like "the
>> probability of this happening *in case* the fix has no effect".  That "the
>> fix has no effect" needs to be a *prerequisite*, and cannot itself be the
>> probability to be computed.  The complement, i.e., 1 - 1.2e-8, is "the
>> confidence level that the probability of failing is less than the
>> original".  I'd suggest using the "confidence level" wording here, but
>> explain what it is earlier in the book to tell the less mathematically apt
>> readers understand the wordings.
>
> Good catch!
>
> How about if I reworded that paragraph as follows?
>
>         Suppose that a given test fails about once every hour, but after a
>         bug fix, a 24-hour test run fails only twice.  Assuming that the
>         failure leading to the bug is a random occurrence, and further
>         assuming that the alleged fix actually had no effect on this
>         particular bug, what is the probability that the small number
>         of failures in the second run was due to random chance? This
>         probability may be calculated by summing Equation 11.26 as
>         follows:

I think if you already say "assuming that the failure ... is a random
occurrence", then "was due to random chance" is redundant.  Perhaps
"What is the probability of the small number of failures, assuming
that the alleged fix actually has no effect on the test failure?"
suffices.  On the other hand, that would not be very consistent with
other parts of the book that uses the "confidence level" terminology.
And the term is not defined elsewhere either.

> I am shying away from explaining "confidence level" because I haven't
> yet come up with a compact and accurate way of doing so.  However, I am
> taking this email as encouragement to keep trying.  ;-)

Yes that is hard.  Actually I like the confidence level wording more,
not only because it is more compact, but also because the wording
clearly explain why the probability calculated is noteworthy.  On the
other hand, I think the book is more on programming rather than
mathematics, so I won't complain if the book does not try to teach
fancy statistical ideas if that is not needed in the main theme.

Regards,
Isaac

