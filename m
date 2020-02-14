Return-Path: <SRS0=ItWa=4C=gmail.com=junchang2020@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=3RyhvndkYXIJ1TjhDBBI3XemH1fUlXm3rtUR09A2z24=;
        b=hBCz/j7/6wFbnwgshpwpZxKJYbmEVSuIbndvFeg6tACC3rrEM2ozT/lCvegM1utA0J
         D0YFU5WTK5MMdrEYufo5RKAmNFOqE6T6zplWTqJ8afJi2ZNl8xMRtPVc4KsgXAShmpTx
         LgqRj0X5N1jjIrjEnXzSsLZit8epRFS37CYKPypNrRB5HnhzQl5uRNLUASMTvJnWzeJ4
         VBOLHVCKPBP8Y5si9QtFETT2xkiQUEbn1IAhbrwhOPa5GZBlbaYO/1nwtsYuj0PN1Gcd
         GX1eaugcS/YCh2CY20mosBhSec9NIuZF3eoFxgVIuUsHQTHUZ6OIZkSixbunViKsQcJg
         CcSA==
Date: Fri, 14 Feb 2020 08:46:38 +0800
From: Junchang Wang <junchang2020@gmail.com>
Subject: Re: [PATCH] datastruct.tex: fix some minor typos
Message-ID: <20200214004636.GB5058@PhD>
References: <20200212143457.GA25828@PhD>
 <47d5dcd4-64e5-57fa-4834-26d077712de6@gmail.com>
 <20200213191919.GH2935@paulmck-ThinkPad-P72>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200213191919.GH2935@paulmck-ThinkPad-P72>
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: Akira Yokosawa <akiyks@gmail.com>, perfbook@vger.kernel.org, junchangwang@gmail.com
List-ID: <perfbook.vger.kernel.org>

Hi Paul,

On Thu, Feb 13, 2020 at 11:19:19AM -0800, Paul E. McKenney wrote:
>On Fri, Feb 14, 2020 at 12:28:24AM +0900, Akira Yokosawa wrote:
>> Hi, Junchang,
>> 
>> On Wed, 12 Feb 2020 22:35:15 +0800, Junchang Wang wrote:
>> > Signed-off-by: Junchang Wang <junchangwang@gmail.com>
>> > ---
>> > 
>> > Hi Paul,
>> > 
>> > I'm reading the latest version of the perfbook and this patch contains fixes to
>> > some typos in Section Data Structures. Hope it helps.
>> > 
>> > Thanks,
>> > --Junchang
>> > 
>> > --
>> >  datastruct/datastruct.tex | 8 ++++----
>> >  1 file changed, 4 insertions(+), 4 deletions(-)
>> > 
>> > diff --git a/datastruct/datastruct.tex b/datastruct/datastruct.tex
>> > index 4b62471..e21952b 100644
>> > --- a/datastruct/datastruct.tex
>> > +++ b/datastruct/datastruct.tex
>> > @@ -700,7 +700,7 @@ Of course, it is quite possible that the differences in lookup performance
>> >  are affected by the differences in update rates.
>> >  One way to check this is to artificially throttle the update rates of
>> >  per-bucket locking and hazard pointers to match that of RCU.
>> > -Doing so does not significantly improve the lookup performace of
>> > +Doing so does not significantly improve the lookup performance of
>> >  per-bucket locking, nor does it close the gap between hazard pointers
>> >  and RCU.
>> >  However, removing the read-side memory barriers from hazard pointers
>> > @@ -800,8 +800,8 @@ scalability, external consistency, or all of the above.
>> >  \section{Non-Partitionable Data Structures}
>> >  \label{sec:datastruct:Non-Partitionable Data Structures}
>> >  %
>> > -\epigraph{Undertake somthing difficult, otherwise you will never grow.}
>> > -	 {\emph{Ronald E.~Osburn}}
>> > +\epigraph{Undertake something difficult, otherwise you will never grow.}
>> > +	 {\emph{Ronald E.~Osborn}}
>> >  
>> >  \begin{figure}[tb]
>> >  \centering
>> > @@ -1063,7 +1063,7 @@ Otherwise, a concurrent resize operation has already distributed this
>> >  bucket, so line~\lnref{new_hashtbl} proceeds to the new hash table,
>> >  line~\lnref{get_newbkt} selects the bucket corresponding to the key,
>> >  and line~\lnref{acq_newbkt} acquires the bucket's lock.
>> > -\Clnref{lsp1b}{lsp1e} store the bucket pointer and
>> > +\Clnrefrange{lsp1b}{lsp1e} store the bucket pointer and
>> 
>> Thanks for catching this!
>
>And from me as well!  Queued and pushed, thank you!
>

Thank you for writing this great book. I'm very happy that I can help
:-)

>> As far as I see, there is no other error in the use of \clnrefrange/\crefrange
>> at the moment.
>> To prevent similar typos in the future, I'll add a check of this pattern somewhere
>> in the build script.
>
>Looking forward to it!
>
>> PS:
>> 
>> The email address in the From: field does not match the SOB tag.
>> Is this intentional?
>
>I made the Signed-off-by: field match the From: field.  This can be
>changed if need be.
>

I'll use the new email address (junchang2020@gmail.com) in my
Signed-off-by message in the future. So it's not necessary for you to
change what you have done. Sorry for confusing you and Akira. 


Thanks,
--Junchang

>							Thanx, Paul
>
>> >  pointer-set index into their respective fields in the
>> >  \co{ht_lock_state} structure, which again communicates this information to
>> >  \co{hashtab_add()}, \co{hashtab_del()}, and \co{hashtab_unlock_mod()}.
>> > 
