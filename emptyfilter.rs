fn main() {
    let data = r#"hello = 1


world = 2"#;
    for line in data.lines().filter(|&x| !x.is_empty()) {
	println!("{line}")
    }
}
