Return-Path: <SRS0=Gwgv=2X=gmail.com=e2lahav@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=TOxVVyfG+eM5AwzJLi2apnritoqSpRCjoAEooZDkGbg=;
        b=e9VMCCInhI1Myw1BfMkNKnpdh6BdNVcs6bLCPdSGFyLHelGBZ14qM3fo9g0oH72ALb
         pm1n4sLeka7Ac/C9CVu9JT9FKRRFlQQ3+o7tEQWL7BriyhfRA1tyMMLJFzpYkbDNocwJ
         qIzZKqNe193U/C/fpOyJQyWZqiIN1I1yMQF7WY0kS5BtcnySF/XQz3/3qfp0XvgxR7XD
         m1SVKG/ZDQz4o2IZl9QhqQ9VofM1S+ZyiR6jk3Vmya5O299q+XRBDFyrRsmYcuN0lefH
         mEAgKfIWfBmjRlG30Jv1CBsp0O8nWRgx7DwE7JG+MCWoU0t0+IYYCYhEMotWhINfTTTF
         MQeQ==
MIME-Version: 1.0
References: <33a8d734-1c7c-98e9-243d-9b05175e0e1d@gmail.com>
In-Reply-To: <33a8d734-1c7c-98e9-243d-9b05175e0e1d@gmail.com>
From: Elad Lahav <e2lahav@gmail.com>
Date: Sat, 22 Oct 2022 19:45:23 -0400
Message-ID: <CAJbg=FUKS+Be6XGUfknxmWdt7007EmGWex-ebrT8OAq7nxdTYQ@mail.gmail.com>
Subject: Re: [PATCH -perfbook] locking: Adjust coding style of rec_tree_itr.c snippet
Content-Type: text/plain; charset="UTF-8"
To: Akira Yokosawa <akiyks@gmail.com>
Cc: "Paul E. McKenney" <paulmck@kernel.org>, perfbook@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>

Fine with me.

(Of course, tabs are an invention of the Devil, and I felt very
Faustian as I re-formatted the code before submitting the patch. The
fact that I still got the indentation wrong just proves that hell hath
no fury like tabified code.)

--Elad

On Sat, 22 Oct 2022 at 11:02, Akira Yokosawa <akiyks@gmail.com> wrote:
>
> perfbook's coding style mostly follows that of the Linux kernel [1].
> One exception is the indents of continuation lines, where TABs are
> used as many as the leading line, while white spaces are used for
> deeper level indents in continuation lines.
>
> This is to keep alignment regardless of TAB:SPC setting.
> In two-column layout (2c), code snippets are rendered with
> TAB:SPC == 1:2, while in one-column layouts (1c and eb), they are
> rendered with TAB:SPC == 1:8.
>
> There is another convention in label names for referencing line
> numbers. The base part of such a label often looks like
> "ln:<chapter>:<base name of source file>:<some id in the file>"
> to make it easy to see where the extracted snippet files (.fcv)
> originates.
>
> Stick to these conventions and make other tweaks listed below:
>
>   - Extend the snippet so that the definitions of the structs used in
>     the code can be presented.
>   - Declare the local variable itr at the beginning of
>     tree_for_each_rec().
>   - Fold a long line which exceeded the column width of two-column
>     layout after the indent adjustment.
>   - Mention the source file name where the reference to the snippet
>     is made for the first time in the text.
>
> Link: [1] https://www.kernel.org/doc/html/latest/process/coding-style.html
> Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
> Cc: Elad Lahav <e2lahav@gmail.com>
> ---
> Hi Paul,
>
> I know I'm doing multiple things at once here.
> If you'd prefer a patch series, I can respin.
>
>         Thanks, Akira
> --
>  CodeSamples/locking/rec_tree_itr.c | 15 +++++++++------
>  locking/locking.tex                |  4 ++--
>  2 files changed, 11 insertions(+), 8 deletions(-)
>
> diff --git a/CodeSamples/locking/rec_tree_itr.c b/CodeSamples/locking/rec_tree_itr.c
> index d091e4cc15c7..20b0d7bc4fce 100644
> --- a/CodeSamples/locking/rec_tree_itr.c
> +++ b/CodeSamples/locking/rec_tree_itr.c
> @@ -20,6 +20,7 @@
>
>  #include "../api.h"
>
> +//\begin{snippet}[labelbase=ln:locking:rec_tree_itr:tree_for_each,commandchars=\\\@\$]
>  struct node {
>         int data;
>         int nchildren;
> @@ -31,15 +32,16 @@ struct tree {
>         struct node *root;
>  };
>
> -//\begin{snippet}[labelbase=ln:locking:rec_tree_iterator:tree_for_each,commandchars=\\\@\$]
>  void tree_for_each_rec(struct tree *tr, struct node *nd,
> -                                          void (*callback)(struct node *))
> +                       void (*callback)(struct node *))
>  {
> +       struct node **itr;
> +
>         spin_unlock(&tr->s);
>         callback(nd);
>         spin_lock(&tr->s);
>
> -       struct node **itr = nd->children;
> +       itr = nd->children;
>         for (int i = 0; i < nd->nchildren; i++) {
>                 tree_for_each_rec(tr, *itr, callback);
>                 itr++;
> @@ -47,7 +49,7 @@ void tree_for_each_rec(struct tree *tr, struct node *nd,
>  }
>
>  void tree_for_each(struct tree *tr,
> -                                  void (*callback)(struct node *))
> +                   void (*callback)(struct node *))
>  {
>         spin_lock(&tr->s);
>         tree_for_each_rec(tr, tr->root, callback);
> @@ -55,12 +57,13 @@ void tree_for_each(struct tree *tr,
>  }
>
>  void tree_add(struct tree *tr, struct node *parent,
> -                         struct node *new_child)
> +              struct node *new_child)
>  {
>         spin_lock(&tr->s);
>         parent->nchildren++;
>         parent->children = realloc(parent->children,
> -                                  sizeof(struct node *) * parent->nchildren);
> +                                  sizeof(struct node *) *
> +                                  parent->nchildren);
>         parent->children[parent->nchildren - 1] = new_child;
>         spin_unlock(&tr->s);
>  }
> diff --git a/locking/locking.tex b/locking/locking.tex
> index c990d4f86a7b..ac8bab8c8a1b 100644
> --- a/locking/locking.tex
> +++ b/locking/locking.tex
> @@ -383,7 +383,7 @@ Because the \co{qsort()} comparison function rarely acquires locks,
>  let's switch to a different example.
>
>  Consider the recursive tree iterator in
> -\cref{lst:locking:Recursive Tree Iterator}.
> +\cref{lst:locking:Recursive Tree Iterator} (\path{rec_tree_itr.c}).
>  The iterator visits every node in the tree, invoking a user's callback
>  function.
>  The tree lock is released before the invocation and re-acquired after return.
> @@ -424,7 +424,7 @@ Alternatively, the state can be re-initialized once the lock is
>  re-acquired after the callback function returns.
>
>  \begin{listing}
> -\input{CodeSamples/locking/rec_tree_iterator@tree_for_each.fcv}
> +\input{CodeSamples/locking/rec_tree_itr@tree_for_each.fcv}
>  \caption{Recursive Tree Iterator}
>  \label{lst:locking:Recursive Tree Iterator}
>  \end{listing}
>
> base-commit: 55c6bfdbfd44cc1090b54dceeb004ae254c93f7c
> --
> 2.25.1
>
