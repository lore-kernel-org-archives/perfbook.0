Return-Path: <SRS0=mvXk=2H=gmail.com=e2lahav@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=gzMDxaSOD9Gq3AVrflOd1Z0P/1kYFW6PDrQeLepiQSs=;
        b=hjcI0DCc9BWLytYOxUg4Dijpz9k1jMM5cPRlFTshYa81rTvblzAXX7nRVzvzYF+vLi
         G8MXHwYJ5UpmvwtAfCKoMd6qjOztmOGNtpQSDARrHQpIpJpQLVssBNq7u8zXp6+1yIYU
         VKsAAnnyDtFVILWxxf5h/qrqFnTK/Pitb/5z7UKaZ0G0H43VOuQSo9Lu1dZ76mQ/o9R4
         67brTInXh6jyljHbOgy8l0CFm6ZAYVyBVWCzhI5ekoLXW/O9j9kzQhYVK5L49xkd4VWo
         n3nX3BFMLv6zoHvptwFG6Mlz1caLipUpbgK/6iZHTQ1KfexbF7rDxCzfIOg66EvfVY8g
         4gpw==
MIME-Version: 1.0
References: <20220929121112.373983-1-e2lahav@gmail.com> <20221006125822.GT4196@paulmck-ThinkPad-P17-Gen-1>
In-Reply-To: <20221006125822.GT4196@paulmck-ThinkPad-P17-Gen-1>
From: Elad Lahav <e2lahav@gmail.com>
Date: Thu, 6 Oct 2022 13:53:54 -0400
Message-ID: <CAJbg=FXkbWPU4naA+DHQGbLk+n-7me+xR8fZ0Xc9d5phMkrPyw@mail.gmail.com>
Subject: Re: [PATCH] locking: Warn about state preservation when releasing and
 re-acquiring locks
Content-Type: text/plain; charset="UTF-8"
To: paulmck@kernel.org
Cc: perfbook@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>

New wording looks good to me.
I will come up with an example so dangerous you can stick a tail to it
and call it a wolf.

--Elad

On Thu, 6 Oct 2022 at 08:58, Paul E. McKenney <paulmck@kernel.org> wrote:
>
> On Thu, Sep 29, 2022 at 08:11:12AM -0400, Elad Lahav wrote:
> > Signed-off-by: Elad Lahav <e2lahav@gmail.com>
>
> Thank you, Elad, and please accept my apologies for being slow.
> This is queued and pushed.
>
> I could not resist the urge to wordsmith, so could you please check
> the updated patch below?
>
> Also, longer term, would you be willing to add code that makes a
> simple but dangerous change in order to better illustrate the problem?
>
>                                                 Thanx, Paul
>
> ------------------------------------------------------------------------
>
> commit a4e1d87b97f8446dd18db11fd7c5b70633bba69c
> Author: Elad Lahav <e2lahav@gmail.com>
> Date:   Thu Sep 29 08:11:12 2022 -0400
>
>     locking: Warn about state preservation when releasing and re-acquiring locks
>
>     [ paulmck: Wordsmith. ]
>
>     Signed-off-by: Elad Lahav <e2lahav@gmail.com>
>     Signed-off-by: Paul E. McKenney <paulmck@kernel.org>
>
> diff --git a/CodeSamples/locking/Makefile b/CodeSamples/locking/Makefile
> index 3663a7d5..cf600636 100644
> --- a/CodeSamples/locking/Makefile
> +++ b/CodeSamples/locking/Makefile
> @@ -1,4 +1,4 @@
> -ARCH_INDEPENDENT = locked_list
> +ARCH_INDEPENDENT = locked_list rec_tree_itr
>  ARCH_DEPENDENT = xchglock
>  PROGS = $(ARCH_INDEPENDENT) $(ARCH_DEPENDENT)
>
> @@ -20,5 +20,8 @@ locked_list: locked_list.c ../api.h
>  xchglock: xchglock.c ../api.h
>         cc -g -Wall -o xchglock xchglock.c -lpthread
>
> +rec_tree_itr: rec_tree_itr.c ../api.h
> +       cc -g -Wall -o rec_tree_itr rec_tree_itr.c -lpthread
> +
>  clean:
>         rm -f $(PROGS)
> diff --git a/CodeSamples/locking/rec_tree_itr.c b/CodeSamples/locking/rec_tree_itr.c
> new file mode 100644
> index 00000000..1445668c
> --- /dev/null
> +++ b/CodeSamples/locking/rec_tree_itr.c
> @@ -0,0 +1,96 @@
> +/*
> + * locked_list.c: Recursive tree iterator
> + *
> + * This program is free software; you can redistribute it and/or modify
> + * it under the terms of the GNU General Public License as published by
> + * the Free Software Foundation; either version 2 of the License, or
> + * (at your option) any later version.
> + *
> + * This program is distributed in the hope that it will be useful,
> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> + * GNU General Public License for more details.
> + *
> + * You should have received a copy of the GNU General Public License
> + * along with this program; if not, you can access it online at
> + * http://www.gnu.org/licenses/gpl-2.0.html.
> + *
> + * Copyright (c) 2022 Elad Lahav
> + */
> +
> +#include "../api.h"
> +
> +#define MAX_CHILDREN 10
> +
> +struct node {
> +    int data;
> +       int nchildren;
> +       struct node *children[MAX_CHILDREN];
> +};
> +
> +struct tree {
> +       spinlock_t s;
> +       struct node *root;
> +};
> +
> +//\begin{snippet}[labelbase=ln:locking:rec_tree_iterator:tree_for_each,commandchars=\\\@\$]
> +void tree_for_each_rec(struct tree *tr, struct node *nd,
> +                                          void (*callback)(struct node *))
> +{
> +       spin_unlock(&tr->s);
> +       callback(nd);
> +       spin_lock(&tr->s);
> +
> +       for (int i = 0; i < nd->nchildren; i++) {
> +               tree_for_each_rec(tr, nd->children[i], callback);
> +       }
> +}
> +
> +void tree_for_each(struct tree *tr,
> +                                  void (*callback)(struct node *))
> +{
> +       spin_lock(&tr->s);
> +       tree_for_each_rec(tr, tr->root, callback);
> +       spin_unlock(&tr->s);
> +}
> +//\end{snippet}
> +
> +void print_node_data(struct node *nd)
> +{
> +    printf("%d\n", nd->data);
> +}
> +
> +int main(int argc, char *argv[])
> +{
> +    struct tree tr;
> +    struct node *nodes = calloc(sizeof(struct node), 10);
> +
> +    for (int i = 0; i < 10; i++) {
> +        nodes[i].data = 100 + i;
> +    }
> +
> +       spin_lock_init(&tr.s);
> +
> +    tr.root = &nodes[0];
> +
> +    nodes[0].nchildren = 3;
> +    nodes[0].children[0] = &nodes[1];
> +    nodes[0].children[1] = &nodes[2];
> +    nodes[0].children[2] = &nodes[3];
> +
> +    nodes[1].nchildren = 2;
> +    nodes[1].children[0] = &nodes[4];
> +    nodes[1].children[1] = &nodes[5];
> +
> +    nodes[2].nchildren = 1;
> +    nodes[2].children[0] = &nodes[6];
> +
> +    nodes[5].nchildren = 3;
> +    nodes[5].children[0] = &nodes[7];
> +    nodes[5].children[1] = &nodes[8];
> +    nodes[5].children[2] = &nodes[9];
> +
> +    tree_for_each(&tr, print_node_data);
> +
> +       return 0;
> +}
> diff --git a/locking/locking.tex b/locking/locking.tex
> index 45a12caa..32f9bad7 100644
> --- a/locking/locking.tex
> +++ b/locking/locking.tex
> @@ -375,6 +375,37 @@ deadlock is avoided if each module separately avoids deadlock.
>  This rule therefore greatly simplifies deadlock analysis and greatly
>  improves modularity.
>
> +Nevertheless, this golden rule comes with a warning.
> +When you release those locks, any state that they protect is subject
> +to arbitrary changes, changes that are all too easy for the function's
> +caller to forget, resulting in subtle and difficult-to-reproduce bugs.
> +Because the \co{qsort()} comparison function rarely acquires locks,
> +let's switch to a different example.
> +
> +Consider the recursive tree iterator in
> +\cref{lst:locking:Recursive Tree Iterator}.
> +The iterator visits every node in the tree, invoking a user's callback
> +function.
> +The tree lock is released before the invocation and re-acquired after return.
> +This code makes dangerous assumptions:
> +\begin{enumerate*}[(1)]
> +\item  The number of children of the current node has not changed,
> +\item  The ancestors stored on the stack by the recursion are still
> +       there, and
> +\item  The visited node itself has not been removed and freed.
> +\end{enumerate*}
> +One strategy is to ensure that state is preserved despite the lock being
> +released, for example, by acquiring a reference on a node to prevent it
> +from being freed.
> +Alternatively, the state can be re-initialized once the lock is
> +re-acquired after the callback function returns.
> +
> +\begin{listing}
> +\input{CodeSamples/locking/rec_tree_iterator@tree_for_each.fcv}
> +\caption{Recursive Tree Iterator}
> +\label{lst:locking:Recursive Tree Iterator}
> +\end{listing}
> +
>  \subsubsection{Layered Locking Hierarchies}
>  \label{sec:locking:Layered Locking Hierarchies}
>
> @@ -385,10 +416,9 @@ improves modularity.
>  \label{fig:locking:Layered Locking Hierarchy for qsort()}
>  \end{figure}
>
> -Unfortunately, it might not be possible for \co{qsort()} to release
> -all of its locks before invoking the comparison function.
> -In this case, we cannot construct a local locking hierarchy by
> -releasing all locks before invoking unknown code.
> +Unfortunately, it might be infeasible to preserve state on the one hand
> +or to re-initialize it on the other, thus ruling out a local locking
> +hierarchy where all locks are released before invoking unknown code.
>  However, we can instead construct a layered locking hierarchy, as shown in
>  \cref{fig:locking:Layered Locking Hierarchy for qsort()}.
>  Here, the \co{cmp()} function uses a new Lock~D that is acquired after
> @@ -1399,7 +1429,7 @@ for example:
>         that some FIFO ordering applies for threads of the same priority.
>  \item  Random, so that the new lock holder is chosen randomly from
>         all threads attempting acquisition, regardless of timing.
> -\item
> +\item
>         Unfair, so that a given acquisition might never acquire the lock
>         (see \cref{sec:locking:Unfairness}).
>  \end{enumerate}
> @@ -1486,7 +1516,7 @@ when switching from read-holder to write-holder mode.
>  Here are a few possible approaches:
>
>  \begin{enumerate}
> -\item
> +\item
>         Reader-preference implementations unconditionally favor readers
>         over writers, possibly allowing write acquisitions to be
>         indefinitely blocked.
