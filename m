Return-Path: <sj38.park@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20120113;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc;        bh=l7UpFBPPyYxSt2XTm19DqfTDoc+57m00d4Xc3Ldzbl0=;
 b=yZsU8I9WOlY/JjRTqAdZdjdKxEYfRzeGL0wENbVVdEdUm2zi7LrbcgCZM0jIZmm9cm
 RzKapNvYD6n+i6owNAf1yr4pFrDUPgnif2vqf8FlHOpp2N9WaCcE/2fWtzGKVtWnM43g
 S6wTl9KnZT2opGMoZLgV4B1cXasLyACRloMBeLrf8+CpD9M64EKrF0JbzK2IHAU3aqWt
 smfC1iWyuK8lxRjxuM21yhyvKUmJMbR2AA2uX4Aa27L447YfHqf8728f2iATars8KsOI
 N75zsNWK+ArPM1vQSaDxkKPoSh25AGp101eC/gMlanFNafkCU+nsUIODYUfqwS2cudOa
 rU7A==
MIME-Version: 1.0
In-Reply-To: <20160717214451.GC7094@linux.vnet.ibm.com>
References: <1468655930-9894-1-git-send-email-sj38.park@gmail.com>
 <1468655930-9894-4-git-send-email-sj38.park@gmail.com>
 <e8aae464-9c9c-411b-597b-50344d81612b@gmail.com>
 <alpine.DEB.2.10.1607170830180.17560@hxeon>
 <17d7718a-ded6-7144-dc42-1a2bee562189@gmail.com>
 <20160717214451.GC7094@linux.vnet.ibm.com>
From: SeongJae Park <sj38.park@gmail.com>
Date: Mon, 18 Jul 2016 06:57:42 +0900
Message-ID: 
 <CAEjAshp5za9cSzhigvNtn=Qg5Hsg_b+3g2OrVtVJn8etAoGgUg@mail.gmail.com>
Subject: Re: [PATCH 3/4] defer/whichtochoose: Trim a sentence
Content-Type: text/plain; charset=UTF-8
To: Paul McKenney <paulmck@linux.vnet.ibm.com>
Cc: Akira Yokosawa <akiyks@gmail.com>, perfbook@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>

On Mon, Jul 18, 2016 at 6:44 AM, Paul E. McKenney
<paulmck@linux.vnet.ibm.com> wrote:
> On Sun, Jul 17, 2016 at 11:16:57AM +0900, Akira Yokosawa wrote:
>> On 2016/07/17 08:40:54 +0900, SeongJae Park wrote:
>> >
>> >
>> >On Sun, 17 Jul 2016, Akira Yokosawa wrote:
>> >
>> >>Hi,
>> >>
>> >>On 2016/07/16 16:58:49 +0900, SeongJae Park wrote:
>> >>>Signed-off-by: SeongJae Park <sj38.park@gmail.com>
>> >>>---
>> >>>defer/whichtochoose.tex | 2 +-
>> >>>1 file changed, 1 insertion(+), 1 deletion(-)
>> >>>
>> >>>diff --git a/defer/whichtochoose.tex b/defer/whichtochoose.tex
>> >>>index 648cdc8..884de9d 100644
>> >>>--- a/defer/whichtochoose.tex
>> >>>+++ b/defer/whichtochoose.tex
>> >>>@@ -135,7 +135,7 @@ capable of unconditionally acquiring references.
>> >>>The entry for sequence locks is ``N/A'' because, again, sequence locks
>> >>>detect updates rather than acquiring references.
>> >>>Reference counting and hazard pointers require that traversals be
>> >>>-restarted from the beginning should a given acquisition fail because
>> >>>+restarted from the beginning if a given acquisition fail because
>> >>
>> >>I can't get the point of this change. Original sentence seems quite natural
>> >>for me.
>> >
>> >Well, I thought it would be easier to understand the meaning for poor
>> >English speakers like me, though judging is Paul's right.  So, please feel
>> >free to discard this patch if you think it's unnecessary, Paul.  BTW, I
>> >think I found one trivial grammar mistake here:
>> >`s/a given acquisition fail/a given acquisition fails/`.
>> >
>> >>
>> >>>the currrent object might be removed and all of its
>> >>>possible successsors might be not only be removed, but also freed.
>> >>>For example, when using reference counting or hazard pointers to
>> >>>
>> >>
>> >>However, there are typos here. We need to modify as follows.
>> >>
>> >>-the currrent object might be removed and all of its
>> >>-possible successsors might be not only be removed, but also freed.
>> >>+the current object might be removed and all of its
>> >>+possible successors might be not only be removed, but also freed.
>> >
>>
>> As I reread the sentence, there is an unnecessary "be" here.
>>
>> -the currrent object might be removed and all of its
>> -possible successsors might be not only be removed, but also freed.
>> +the current object might be removed and all of its
>> +possible successors might be not only removed, but also freed.
>>
>> Or we can say:
>>
>> +the current object might be removed and all of its
>> +possible successors might not only be removed, but also be freed.
>>
>> I agree with you that this sentence is fairy complicated.
>> There might be a better way to rephrase, for example, denoting
>> the end of that-clause by a comma as appended:
>
> Hmmm...  That certainly was not one of my better efforts, was it?  ;-)
>
> I reworked that paragraph and surrounding paragraphs as shown below.
> Does that help?
>
> I also applied the other three of SeongJae's patches, thank you!
> And thanks to you both for your review and comments!

Looks much better, thanks!


Thanks,
SeongJae Park

>
>                                                         Thanx, Paul
>
> ------------------------------------------------------------------------
>
> commit 22455cae203ae6707970d0565fe70dfdc4ada1ca
> Author: Paul E. McKenney <paulmck@linux.vnet.ibm.com>
> Date:   Sun Jul 17 14:41:47 2016 -0700
>
>     Self review of "Which to Choose" section
>
>     Reported-by: SeongJae Park <sj38.park@gmail.com>
>     Reported-by: Akira Yokosawa <akiyks@gmail.com>
>     Signed-off-by: Paul E. McKenney <paulmck@linux.vnet.ibm.com>
>
> diff --git a/defer/whichtochoose.tex b/defer/whichtochoose.tex
> index 648cdc88e406..11f3b0a24e87 100644
> --- a/defer/whichtochoose.tex
> +++ b/defer/whichtochoose.tex
> @@ -132,26 +132,48 @@ instructions.
>
>  The ``Reader Reference Acquisition'' rows indicates that only RCU is
>  capable of unconditionally acquiring references.
> -The entry for sequence locks is ``N/A'' because, again, sequence locks
> +The entry for sequence locks is ``Unsafe'' because, again, sequence locks
>  detect updates rather than acquiring references.
> -Reference counting and hazard pointers require that traversals be
> -restarted from the beginning should a given acquisition fail because
> -the currrent object might be removed and all of its
> -possible successsors might be not only be removed, but also freed.
> -For example, when using reference counting or hazard pointers to
> -protect a tree traversal, any reference-acquisition failure requires
> -that the traversal be restarted from the root of the tree.
> +Reference counting and hazard pointers both require that traversals be
> +restarted from the beginning if a given acquisition fails.
> +To see this, consider a linked list containing objects~A, B, C, and~D,
> +in that order, and the following series of events:
> +
> +\begin{enumerate}
> +\item  A reader acquires a reference to object~B.
> +\item  An updater removes~object B, but refrains from freeing it because
> +       the reader holds a reference.
> +       The list now contains objects~A, C, and~D, and
> +       object~B's \co{->next} pointer is set to \co{HAZPTR_POISON}.
> +\item  The updater removes object~C, so that the list now contains
> +       objects~A and~D.
> +       Because there is no reference to object~C, it is immediately freed.
> +\item  The reader tries to advance to the successor of the object
> +       following the now-removed object~B, but the poisoned
> +       \co{->next} pointer prevents this.
> +       Which is a good thing, because object~B's \co{->next} pointer
> +       would otherwise point to the freelist.
> +\item  The reader must therefore restart its traversal from the head
> +       of the list.
> +\end{enumerate}
> +
> +Thus, when failing to acquire a reference, a hazard-pointer or
> +reference-counter traversal must restart that traversal from the
> +beginning.
> +In the case of nested linked data structures, for example, a
> +tree containing linked lists, the traversal must be restarted from
> +the outermost data structure.
>  This situation gives RCU a significant ease-of-use advantage.
>
>  However, RCU's ease-of-use advantage does not come
>  for free, as can be seen in the ``Memory Footprint'' row.
>  RCU's support of unconditional reference acquisition means that
> -it must avoid freeing any object visible to a given RCU reader
> -until that reader completes.
> -RCU therefore has an unbounded footprint, at least unless updates
> -are artificially throttled.
> -In contrast, reference counting and hazard pointers would retain only
> -those specific data elements actually referenced by concurrent readers.
> +it must avoid freeing any object reachable by a given
> +RCU reader until that reader completes.
> +RCU therefore has an unbounded memory footprint, at least unless updates
> +are throttled.
> +In contrast, reference counting and hazard pointers need to  retain only
> +those data elements actually referenced by concurrent readers.
>
>  This tension between memory footprint and acquisition
>  failures is sometimes resolved within the Linux kernel by combining use
> @@ -159,7 +181,7 @@ of RCU and reference counters.
>  RCU is used for short-lived references, which means that RCU read-side
>  critical sections can be short.
>  These short RCU read-side critical sections in turn mean that the corresponding
> -RCU grace periods can also be short, limiting the memory footprint.
> +RCU grace periods can also be short, which limits the memory footprint.
>  For the few data elements that need longer-lived references, reference
>  counting is used.
>  This means that the complexity of reference-acquisition failure only
> @@ -181,14 +203,19 @@ a wait to free memory, which results in an situation that, for many
>  purposes, is as good as non-blocking~\cite{MathieuDesnoyers2012URCU}.
>
>  As shown in the ``Automatic Reclamation'' row, only reference
> -counting can automate freeing of memory, at least assuming non-cyclic
> -data structures.
> +counting can automate freeing of memory, and even then only
> +for non-cyclic data structures.
>
>  Finally, the ``Lines of Code'' row shows the size of the Pre-BSD
>  Routing Table implementations, giving a rough idea of relative ease of use.
>  That said, it is important to note that the reference-counting and
>  sequence-locking implementations are buggy, and that a correct
> -reference-counting implementation is considerably more complex.
> +reference-counting implementation is considerably
> +more complex~\cite{Valois95a,MagedMichael95a}.
> +For its part, a correct sequence-locking implementation requires
> +the addition of some other synchronization mechanism, for example,
> +hazard pointers or RCU, so that sequence locking detects concurrent
> +updates and the other mechanism provides safe reference acquisition.
>
>  As more experience is gained using these techniques, both separately
>  and in combination, the rules of thumb laid out in this section will
>

