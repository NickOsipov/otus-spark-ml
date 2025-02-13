from invoke import task


@task
def hello_world(ctx):
    ctx.run("echo 'Hello World'")
    ctx.run("ls -la")
